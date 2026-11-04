import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/network_exceptions.dart';
import 'package:hr_app/features/manager_attendance/data/models/attendance_params.dart';
import 'package:hr_app/features/manager_attendance/domain/entities/manager_attendance_entity.dart';

abstract class ManagerAttendanceRemoteDataSource {
  Future<ManagerAttendanceEntity> fetchAttendance(
    ManagerAttendanceParams params,
  );
}

typedef ManagerAttendanceRemoteDataSrc = ManagerAttendanceRemoteDataSource;

class ManagerAttendanceRemoteDataSourceImpl
    implements ManagerAttendanceRemoteDataSource {
  final DioClient dioClient;

  ManagerAttendanceRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => NetworkExceptions.handle(e);

  @override
  Future<ManagerAttendanceEntity> fetchAttendance(
    ManagerAttendanceParams params,
  ) async {
    try {
      final response = await dioClient.post(
        '/manager/AttendanceList',
        data: params.toMap(),
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch attendance',
        );
      }
      return ManagerAttendanceEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}

typedef ManagerAttendanceRemoteDataSrcImpl =
    ManagerAttendanceRemoteDataSourceImpl;
