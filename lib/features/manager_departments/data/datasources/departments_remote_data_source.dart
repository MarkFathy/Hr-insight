import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/network_exceptions.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_entity.dart';
import 'package:hr_app/features/manager_departments/domain/entities/departments_params.dart';
import 'package:hr_app/features/manager_departments/domain/entities/job_param.dart';

abstract class DepartmentsRemoteDataSource {
  Future<DepartmentsEntity> fetchDepartments();
  Future<DepartmentsEntity> addDepartment(String params);
  Future<DepartmentsEntity> editDepartment(DepartmentsParams params);
  Future<DepartmentsEntity> deleteDepartment(int id);
  Future<DepartmentsEntity> addJob(DepartmentsParams params);
  Future<DepartmentsEntity> editJob(JobParams params);
  Future<DepartmentsEntity> deleteJob(int id);
}

typedef DepartmentsAndJobRemoteSrc = DepartmentsRemoteDataSource;
typedef DepartmentsRemoteDataSrc = DepartmentsRemoteDataSource;

class DepartmentsRemoteDataSourceImpl implements DepartmentsRemoteDataSource {
  final DioClient dioClient;

  DepartmentsRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => NetworkExceptions.handle(e);

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
  Future<DepartmentsEntity> addDepartment(String name) async {
    try {
      final response = await dioClient.post(
        '/manager/department',
        data: {'name': name},
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
  Future<DepartmentsEntity> editDepartment(DepartmentsParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/department/update',
        data: params.toMap(),
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
  Future<DepartmentsEntity> deleteDepartment(int id) async {
    try {
      final response = await dioClient.post(
        '/manager/department/delete',
        data: {'id': id},
      );
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
  Future<DepartmentsEntity> addJob(DepartmentsParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/job',
        data: params.toMap(),
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
  Future<DepartmentsEntity> editJob(JobParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/job/update',
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

  @override
  Future<DepartmentsEntity> deleteJob(int id) async {
    try {
      final response = await dioClient.post(
        '/manager/job/delete',
        data: {'id': id},
      );
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
}

typedef DepartmentsAndJobsRemoteSrcImpl = DepartmentsRemoteDataSourceImpl;
typedef DepartmentsRemoteDataSrcImpl = DepartmentsRemoteDataSourceImpl;
