import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/network_exceptions.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leave_params.dart';
import 'package:hr_app/features/employee_leaves/domain/entities/leaves_entity.dart';

abstract class LeavesRemoteDataSource {
  Future<LeavesEntity> fetchLeaves();
  Future<void> requestLeave(LeaveParams params);
}

typedef LeavesRemoteDataSrc = LeavesRemoteDataSource;

class LeavesRemoteDataSourceImpl implements LeavesRemoteDataSource {
  final DioClient dioClient;

  LeavesRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => NetworkExceptions.handle(e);

  @override
  Future<LeavesEntity> fetchLeaves() async {
    try {
      final response = await dioClient.get('/employee/leavesList');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch leaves',
        );
      }
      return LeavesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<void> requestLeave(LeaveParams params) async {
    try {
      final response = await dioClient.post(
        '/employee/leave',
        data: params.toMap(),
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to request leave',
        );
      }
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}

typedef LeavesRemoteDataSrcImpl = LeavesRemoteDataSourceImpl;
