import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/errors/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/dio_error_handler.dart';
import 'package:hr_app/features/manager/employees/domain/entities/employees_entity.dart';

abstract class EmployeesRemoteSrc {
  Future<EmployeesEntity> fetchEmployees();
  Future<EmployeesEntity> deleteEmployee(int id);
}

class EmployeesRemoteSrcImpl implements EmployeesRemoteSrc {
  final DioClient dioClient;

  EmployeesRemoteSrcImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<EmployeesEntity> fetchEmployees() async {
    try {
      final response = await dioClient.get('/manager/employees');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch employees',
        );
      }
      return EmployeesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<EmployeesEntity> deleteEmployee(int id) async {
    try {
      final response = await dioClient.delete('/manager/deleteEmployee/$id');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to delete employee',
        );
      }
      return EmployeesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
