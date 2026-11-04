import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/network_exceptions.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/attendance_entity.dart';
import 'package:hr_app/features/employee_attendance/domain/entities/sign_entity.dart';
import 'package:latlong2/latlong.dart';

abstract class AttendanceRemoteDataSource {
  Future<AttendanceEntity> fetchAttendance();
  Future<SignEntity> sign({
    required bool isAttend,
    int? attendanceId,
    String? date,
  });
}

class AttendanceRemoteDataSourceImpl implements AttendanceRemoteDataSource {
  final DioClient dioClient;

  AttendanceRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => NetworkExceptions.handle(e);

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
  Future<SignEntity> sign({
    required bool isAttend,
    int? attendanceId,
    String? date,
  }) async {
    final location = await getCurrentLocation();
    try {
      const endpoint = '/employee/setAttendance';
      final body = <String, dynamic>{
        'lat': location!.latitude,
        'lng': location.longitude,
      };
      if (attendanceId != null) {
        body['id'] = attendanceId;
        body['attendance_id'] = attendanceId;
      }
      if (date != null && date.trim().isNotEmpty) {
        body['date'] = date.trim();
      }

      final response = await dioClient.post(endpoint, data: body);

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

typedef AttendanceRemoteDataSrc = AttendanceRemoteDataSource;
typedef AttendanceRemoteDataSrcImpl = AttendanceRemoteDataSourceImpl;
