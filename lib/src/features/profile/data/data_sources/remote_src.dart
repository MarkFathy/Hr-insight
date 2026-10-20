import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/src/core/errors/exceptions.dart';
import 'package:hr_app/src/core/network/dio_client.dart';
import 'package:hr_app/src/core/network/dio_error_handler.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';

abstract class ProfileRemoteDataSrc {
  Future<String> getProfile({required bool isEmployee});
  Future<EmployeeProfileModel> updateProfile(UpdateProfileParams params);
}

class ProfileRemoteDataSrcImpl implements ProfileRemoteDataSrc {
  final DioClient dioClient;

  ProfileRemoteDataSrcImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<String> getProfile({required bool isEmployee}) async {
    try {
      final endpoint = '/${isEmployee ? 'employee' : 'manager'}/profile';
      final response = await dioClient.get(endpoint);
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch profile',
        );
      }
      return response.data is String
          ? response.data as String
          : jsonEncode(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<EmployeeProfileModel> updateProfile(UpdateProfileParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/acceptRejectLeave',
        data: params.toMap(),
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to update profile',
        );
      }
      return EmployeeProfileModel.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
