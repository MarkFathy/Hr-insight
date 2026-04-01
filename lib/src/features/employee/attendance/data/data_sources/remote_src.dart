import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/employee/attendance/data/models/sign_model.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class AttendanceRemoteDataSrc {
  Future<AttendanceModel> fetchAttendance();
  Future<SignModel> sign(bool params);
}

class AttendanceRemoteDataSrcImpl implements AttendanceRemoteDataSrc {
  final Token token;
  final http.Client client;

  AttendanceRemoteDataSrcImpl({required this.client, required this.token});
  @override
  Future<AttendanceModel> fetchAttendance() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/employee/attendanceList"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      return AttendanceModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<SignModel> sign(bool params) async {
    final location = await getCurrentLocation();
    final response = await client.post(
        Uri.parse(
            "${AppConsts.baseUrl}/employee/${params ? 'setAttendance' : 'setDeparture'}"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body:
            jsonEncode({'lat': location!.latitude, 'lng': location.longitude}));

    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      } else {
        return SignModel.fromJson(response.body);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  Future<LatLng?> getCurrentLocation() async {
    LocationPermission permissionGranted;

    try {
      permissionGranted = await Geolocator.requestPermission();
    } catch (e) {
      rethrow;
    }
    bool serviceEnabled;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw ServerException('من فضلك قم بتفعيل الـ GPS على جهازك');
    }
    permissionGranted = await Geolocator.checkPermission();
    if (permissionGranted == LocationPermission.denied) {
      permissionGranted = await Geolocator.requestPermission();
      if (permissionGranted != LocationPermission.whileInUse &&
          permissionGranted != LocationPermission.always) {
        throw ServerException('من فضلك قم بالسماح للتطبيق باستخدام موقعك');
      }
    }

    Position userLocation = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best)
        .catchError((e) {
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
