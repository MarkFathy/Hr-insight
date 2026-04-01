import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';

import 'package:http/http.dart' as http;

abstract class OfficesRemoteSrc {
  Future<OfficesEntity> fetchOffices();
  Future<OfficesEntity> addOffice(OfficeParams params);
  Future<String> setEmployee(SetEmployeeParams id);

  Future<OfficesEntity> editOffice(OfficeParams params);

  Future<OfficesEntity> deleteOffice(int id);
  Future<OfficeDetailsEntity> getOfficeDetails(int id);
}

class OfficesRemoteSrcImpl implements OfficesRemoteSrc {
  final Token token;
  final http.Client client;

  OfficesRemoteSrcImpl({required this.client, required this.token});
  @override
  Future<OfficesEntity> fetchOffices() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/offices"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      return OfficesEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<OfficesEntity> addOffice(OfficeParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/add-office"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: params.toMap());
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(json.decode(response.body)['message']);
      } else {
        return OfficesEntity.fromJson(response.body);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<OfficesEntity> deleteOffice(int id) async {
    final response = await client.post(
      Uri.parse("${AppConsts.baseUrl}/manager/delete-office/$id"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      // print(response.body);
      return OfficesEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<OfficesEntity> editOffice(OfficeParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/update-office/${params.id}"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: params.toMap());

    if (response.statusCode < 400) {
      // print(response.body);
      return OfficesEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<OfficeDetailsEntity> getOfficeDetails(int id) async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/office/$id"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );
    if (response.statusCode < 400) {
      return OfficeDetailsEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<String> setEmployee(SetEmployeeParams params) async {
    final response = await client.post(
        Uri.parse(
            "${AppConsts.baseUrl}/manager/employeeSetting/${params.employeeId}"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: {
          'office_id': params.officeId.toString(),
          'job_id': params.jobId.toString()
        });

    if (response.statusCode < 400) {
      return jsonDecode(response.body)['message'];
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
