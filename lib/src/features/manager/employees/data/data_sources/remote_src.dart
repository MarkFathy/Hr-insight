import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/manager/employees/domain/entities/employees_entity.dart';

import 'package:http/http.dart' as http;

abstract class EmployeesRemoteSrc {
  Future<EmployeesEntity> fetchEmployees();

  Future<EmployeesEntity> deleteEmployee(int id);
}

class EmployeesRemoteSrcImpl implements EmployeesRemoteSrc {
  final Token token;
  final http.Client client;

  EmployeesRemoteSrcImpl({required this.client, required this.token});
  @override
  Future<EmployeesEntity> fetchEmployees() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/employees"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      debugPrint(
          EmployeesEntity.fromJson(response.body).data!.length.toString(),
          wrapWidth: 100000);
      return EmployeesEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  // @override
  // Future<OfficesEntity> addOffice(OfficeParams params) async {
  //   final response = await client.post(
  //       Uri.parse("${AppConsts.baseUrl}/manager/add-office"),
  //       headers: {
  //         "Accept": "application/json",
  //         "Authorization": 'Bearer ${token.getToken}'
  //       },
  //       body: params.toMap());
  //   print(response.statusCode);

  //   if (response.statusCode < 400) {
  //     print(response.body);
  //     return OfficesEntity.fromJson(response.body);
  //   } else {
  //     throw ServerException(json.decode(response.body)['message']);
  //   }
  // }

  @override
  Future<EmployeesEntity> deleteEmployee(int id) async {
    final response = await client.delete(
      Uri.parse("${AppConsts.baseUrl}/manager/deleteEmployee/$id"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      return EmployeesEntity.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  // @override
  // Future<OfficeDetailsEntity> getOfficeDetails(int id) async {
  //   final response = await client.get(
  //     Uri.parse("${AppConsts.baseUrl}/manager/offices/$id"),
  //     headers: {
  //       "Accept": "application/json",
  //       "Content-Type": "application/json",
  //       "Authorization": 'Bearer ${token.getToken}'
  //     },
  //   );

  //   if (response.statusCode < 400) {
  //     print(response.body);
  //     return OfficeDetailsEntity.fromJson(response.body);
  //   } else {
  //     throw ServerException(json.decode(response.body)['message']);
  //   }
  // }
}
