import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/dio_error_handler.dart';
import 'package:hr_app/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/employee_register_params.dart';
import 'package:hr_app/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/features/authentication/domain/entities/manager_register_params.dart';
import 'package:hr_app/features/authentication/domain/entities/reset_password_params.dart';
import 'package:hr_app/features/authentication/domain/entities/verify_params.dart';

abstract class AuthRemoteDataSource {
  Future<EmployeeEntity?> employeeSignIn({
    required String email,
    required String password,
  });
  Future<ManagerEntity?> managerSignIn({
    required String email,
    required String password,
  });
  Future<ManagerEntity> managerSignUp(ManagerRegisterParams params);
  Future<EmployeeEntity> employeeSignUp(EmployeeRegisterParams params);
  Future<ManagerInfoEntity> getDepartments(String params);
  Future<String> changePassword(ChangePasswordParams params);
  Future<Map<String, dynamic>> verifyEmail(VerifyParams params);
  Future<Map<String, dynamic>> veridfyEmail(
    VerifyParams params,
  ); // compatibility
  Future<Map<String, dynamic>> resetPassword(ResetPasswordParams params);
  Future<Map<String, dynamic>> forgetPassword(ForgetPasswordParams params);
  Future<void> deleteAccount(AccountDeleteParams params);
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final DioClient dioClient;

  AuthRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<EmployeeEntity> employeeSignIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        '/employee/login',
        data: {'email': email, 'password': password},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(data['message']?.toString() ?? 'Sign in failed');
      }
      return EmployeeEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<EmployeeEntity> employeeSignUp(EmployeeRegisterParams params) async {
    try {
      final imagePath = params.image.path;
      final filename = imagePath.split('/').last.split(r'\').last;

      final formData = FormData.fromMap({
        'name': params.name,
        'email': params.email,
        'password': params.password,
        'password_confirmation': params.confirmPassword,
        'phone': params.phone,
        'address': params.address,
        'manager_pin': params.managerPin,
        'department_id': params.departmentId.toString(),
        'job_id': params.jobId.toString(),
        'office_id': params.officeId.toString(),
        'image': await MultipartFile.fromFile(imagePath, filename: filename),
      });

      final response = await dioClient.post(
        '/employee/register',
        data: formData,
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Registration failed',
        );
      }
      return EmployeeEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<ManagerEntity> managerSignUp(ManagerRegisterParams params) async {
    try {
      final imagePath = params.image.path;
      final filename = imagePath.split('/').last.split(r'\').last;

      final formData = FormData.fromMap({
        'name': params.name,
        'email': params.email,
        'password': params.password,
        'password_confirmation': params.passwordConfirmation,
        'phone': params.phone,
        'company_name': params.companyName,
        'image': await MultipartFile.fromFile(imagePath, filename: filename),
      });

      final response = await dioClient.post(
        '/manager/register',
        data: formData,
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Registration failed',
        );
      }
      return ManagerEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<ManagerInfoEntity> getDepartments(String params) async {
    try {
      final response = await dioClient.post(
        '/employee/managerInfoByUID',
        data: {'uid': params},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to retrieve manager info',
        );
      }
      return ManagerInfoEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<ManagerEntity?> managerSignIn({
    required String email,
    required String password,
  }) async {
    try {
      final response = await dioClient.post(
        '/manager/login',
        data: {'email': email, 'password': password},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(data['message']?.toString() ?? 'Sign in failed');
      }
      return ManagerEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<String> changePassword(ChangePasswordParams params) async {
    try {
      final response = await dioClient.post(
        '/employee/changePassword',
        data: params.toMap(),
        options: Options(headers: {'Authorization': 'Bearer ${params.token}'}),
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to change password',
        );
      }
      return data['message']?.toString() ?? 'Password changed successfully';
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> verifyEmail(VerifyParams params) async {
    try {
      final endpoint = params.isEmployee
          ? '/employee/verifyMail'
          : '/manager/verifyMail';
      final response = await dioClient.post(endpoint, data: params.toMap());

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Verification failed',
        );
      }
      return data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> veridfyEmail(VerifyParams params) =>
      verifyEmail(params);

  @override
  Future<Map<String, dynamic>> resetPassword(ResetPasswordParams params) async {
    try {
      final endpoint = params.isEmployee
          ? '/employee/resetPassword'
          : '/manager/resetPassword';
      final response = await dioClient.post(
        endpoint,
        data: params.toMap(),
        options: Options(headers: {'Authorization': 'Bearer ${params.token}'}),
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Reset password failed',
        );
      }
      return data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword(
    ForgetPasswordParams params,
  ) async {
    try {
      final endpoint = params.isEmployee
          ? '/employee/forgetPassword'
          : '/manager/forgetPassword';
      final response = await dioClient.post(
        endpoint,
        data: {'email': params.email},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to send password reset',
        );
      }
      return data;
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<void> deleteAccount(AccountDeleteParams params) async {
    try {
      final endpoint = params.isEmployee
          ? '/employee/deleteAccount'
          : '/manager/deleteAccount';
      final response = await dioClient.delete(
        endpoint,
        data: {'password': params.password},
      );

      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to delete account',
        );
      }
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}

/// Backwards compatibility aliases
typedef AuthRemoteSource = AuthRemoteDataSource;
typedef AuthRemoteSourceImpl = AuthRemoteDataSourceImpl;
