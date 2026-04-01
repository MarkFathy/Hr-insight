import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_params.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/job_param.dart';
import 'package:http/http.dart' as http;

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
  final Token token;
  final http.Client client;

  DepartmentsAndJobsRemoteSrcImpl({required this.client, required this.token});
  @override
  Future<DepartmentsEntity> fetchDepartments() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/departments"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      return DepartmentsEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> addDepartment(String params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/createDepartment"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: {
          'name': params
        });
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(json.decode(response.body)['message']);
      } else {
        return DepartmentsEntity.fromJson(response.body);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> deleteDepartment(int id) async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/deleteDepartment/$id"),
      headers: {"Authorization": 'Bearer ${token.getToken}'},
    );

    if (response.statusCode < 400) {
      return DepartmentsEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> editDepartment(DepartmentsParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/updateDepartment"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: {
          'name': params.name,
          'department_id': params.id.toString()
        });

    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(json.decode(response.body)['message']);
      } else {
        return DepartmentsEntity.fromJson(response.body);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> addJob(DepartmentsParams params) async {
    final response = await client
        .post(Uri.parse("${AppConsts.baseUrl}/manager/createJob"), headers: {
      "Accept": "application/json",
      "Authorization": 'Bearer ${token.getToken}'
    }, body: {
      'department_id': params.id.toString(),
      'title': params.name
    });
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(json.decode(response.body)['message']);
      } else {
        return DepartmentsEntity.fromJson(response.body);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> deleteJob(int id) async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/deleteJob/$id"),
      headers: {"Authorization": 'Bearer ${token.getToken}'},
    );
    if (response.statusCode < 400) {
      return DepartmentsEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<DepartmentsEntity> editJob(JobParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/updateJob"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: params.toMap());

    if (response.statusCode < 400) {
      return DepartmentsEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
