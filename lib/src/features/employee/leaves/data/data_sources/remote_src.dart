import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/network/dio_client.dart';
import 'package:hr_app/src/core/network/dio_error_handler.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';

abstract class LeavesRemoteDataSrc {
  Future<LeavesEntity> fetchLeaves();
  Future<void> requestLeave(LeaveParams params);
}

class LeavesRemoteDataSrcImpl implements LeavesRemoteDataSrc {
  final DioClient dioClient;

  LeavesRemoteDataSrcImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

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
