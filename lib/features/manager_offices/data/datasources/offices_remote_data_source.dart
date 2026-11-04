import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hr_app/core/error/exceptions.dart';
import 'package:hr_app/core/network/dio_client.dart';
import 'package:hr_app/core/network/dio_error_handler.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_details.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';

abstract class OfficesRemoteDataSource {
  Future<OfficesEntity> fetchOffices();
  Future<OfficesEntity> addOffice(OfficeParams params);
  Future<String> setEmployee(SetEmployeeParams id);
  Future<OfficesEntity> editOffice(OfficeParams params);
  Future<OfficesEntity> deleteOffice(int id);
  Future<OfficeDetailsEntity> getOfficeDetails(int id);
}

typedef OfficesRemoteSrc = OfficesRemoteDataSource;

class OfficesRemoteDataSourceImpl implements OfficesRemoteDataSource {
  final DioClient dioClient;

  OfficesRemoteDataSourceImpl({required this.dioClient});

  Map<String, dynamic> _extractData(dynamic data) {
    if (data is Map<String, dynamic>) return data;
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is String) return jsonDecode(data) as Map<String, dynamic>;
    throw ServerException('Invalid response data from server');
  }

  Never _handleDioError(DioException e) => DioErrorHandler.handle(e);

  @override
  Future<OfficesEntity> fetchOffices() async {
    try {
      final response = await dioClient.get('/manager/offices');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to fetch offices',
        );
      }
      return OfficesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<OfficesEntity> addOffice(OfficeParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/add-office',
        data: params.toMap(),
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to add office',
        );
      }
      return OfficesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<OfficesEntity> deleteOffice(int id) async {
    try {
      final response = await dioClient.post('/manager/delete-office/$id');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to delete office',
        );
      }
      return OfficesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<OfficesEntity> editOffice(OfficeParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/update-office/${params.id}',
        data: params.toMap(),
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to edit office',
        );
      }
      return OfficesEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<OfficeDetailsEntity> getOfficeDetails(int id) async {
    try {
      final response = await dioClient.get('/manager/office/$id');
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to get office details',
        );
      }
      return OfficeDetailsEntity.fromJson(data);
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }

  @override
  Future<String> setEmployee(SetEmployeeParams params) async {
    try {
      final response = await dioClient.post(
        '/manager/employeeSetting/${params.employeeId}',
        data: {
          'office_id': params.officeId.toString(),
          'job_id': params.jobId.toString(),
        },
      );
      final data = _extractData(response.data);
      if (data['status'] == 0) {
        throw ServerException(
          data['message']?.toString() ?? 'Failed to assign employee',
        );
      }
      return data['message']?.toString() ?? 'Success';
    } on DioException catch (e) {
      _handleDioError(e);
    }
  }
}

typedef OfficesRemoteSrcImpl = OfficesRemoteDataSourceImpl;
