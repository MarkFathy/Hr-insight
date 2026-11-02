import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/errors/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/dio_error_handler.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager/departments/domain/entities/job_param.dart';

abstract class DepartmentsAndJobRemoteSrc {
  Future<DepartmentsEntity> fetchDepartments();
  Future<DepartmentsEntity> addDepartment(String params);
  Future<DepartmentsEntity> editDepartment(DepartmentsParams params);
  Future<DepartmentsEntity> deleteDepartment(int id);
  Future<DepartmentsEntity> addJob(DepartmentsParams params);
  Future<DepartmentsEntity> editJob(JobParams params);
  Future<DepartmentsEntity> deleteJob(int id);
}

class DepartmentsAndJobsRemoteSrcImpl implements DepartmentsAndJobRemoteSrc {
  final DioClient dioClient;

  DepartmentsAndJobsRemoteSrcImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<DepartmentsEntity> fetchDepartments() async {
    try {
      final response = await dioClient.get('/manager/departments');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch departments',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> addDepartment(String params) async {
    try {
      final response = await dioClient.post(
        '/manager/createDepartment',
        data: {'name': params},
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to add department',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> deleteDepartment(int id) async {
    try {
      final response = await dioClient.get('/manager/deleteDepartment/$id');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to delete department',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> editDepartment(DepartmentsParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/updateDepartment',
        data: {'name': params.name, 'department_id': params.id.toString()},
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to edit department',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> addJob(DepartmentsParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/createJob',
        data: {'department_id': params.id.toString(), 'title': params.name},
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to add job',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> deleteJob(int id) async {
    try {
      final response = await dioClient.get('/manager/deleteJob/$id');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to delete job',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<DepartmentsEntity> editJob(JobParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/updateJob',
        data: params.toMap(),
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to edit job',
        );
      }
      return DepartmentsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}
