import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/network/dio_client.dart';
import 'package:hr_app/src/core/network/dio_error_handler.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';
import 'package:latlong2/latlong.dart';

abstract class AttendanceRemoteDataSrc {
  Future<AttendanceEntity> fetchAttendance();
  Future<SignEntity> sign({required bool isAttend});
}

class AttendanceRemoteDataSrcImpl implements AttendanceRemoteDataSrc {
  final DioClient dioClient;

  AttendanceRemoteDataSrcImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<AttendanceEntity> fetchAttendance() async {
    try {
      final response = await dioClient.get('/employee/attendanceList');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch attendance',
        );
      }
      return AttendanceEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<SignEntity> sign({required bool isAttend}) async {
    final location = await getCurrentLocation();
    try {
      final endpoint = '/employee/${isAttend ? 'setAttendance' : 'setDeparture'}';
      final response = await dioClient.post(
        endpoint,
        data: {'lat': location!.latitude, 'lng': location.longitude},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(data['message']?.toString() ?? 'Sign failed');
      }
      return SignEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  Future<LatLng?> getCurrentLocation() async {
    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw ServerException('من فضلك قم بتفعيل الـ GPS على جهازك');
    }

    var permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
      if (permissionGranted != LocationPermission.whileInUse &&
          permissionGranted != LocationPermission.always) {
        throw ServerException('من فضلك قم بالسماح للتطبيق باستخدام موقعك');
      }
    }

    if (permissionGranted == LocationPermission.deniedForever) {
      throw ServerException(
        'صلاحية الموقع مرفوضة نهائياً، يرجى تفعيلها من إعدادات الهاتف',
      );
    }

    final userLocation = await Geolocator.getCurrentPosition().catchError((
      Object e,
    ) {
      debugPrint('Please open and check GPS permission for this app.');
      throw e;
    });

    if (userLocation.isMocked) {
      throw ServerException('قم بإغلاق اى تطبيق اخر يقوم باستخدام موقعك');
    } else {
      return LatLng(userLocation.latitude, userLocation.longitude);
    }
  }
}
