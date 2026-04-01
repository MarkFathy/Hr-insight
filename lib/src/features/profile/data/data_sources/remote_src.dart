import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';
import 'package:http/http.dart' as http;

abstract class ProfileRemoteDataSrc {
  Future<String> getProfile(bool isEmployee);
  Future<EmployeeProfileModel> updateProfile(UpdateProfileParams params);
}

class ProfileRemoteDataSrcImpl implements ProfileRemoteDataSrc {
  final Token token;
  final http.Client client;

  ProfileRemoteDataSrcImpl({required this.client, required this.token});
  @override
  Future<String> getProfile(bool isEmployee) async {
    final response = await client.get(
      Uri.parse(
          "${AppConsts.baseUrl}/${isEmployee ? "employee" : "manager"}/profile"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      }
      return response.body;
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<EmployeeProfileModel> updateProfile(UpdateProfileParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/acceptRejectLeave"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: jsonEncode(params.toMap()));
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      }
      return EmployeeProfileModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
