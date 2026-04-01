import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/authentication/domain/entities/account_delete_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/change_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/forget_password_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_info_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/reset_password_params.dart.dart';
import 'package:hr_app/src/features/authentication/domain/entities/verify_params.dart';
import 'package:http/http.dart' as http;
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/authentication/domain/entities/survant_register_params.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/authentication/domain/entities/user_register_params.dart';

const apiKey = "AIzaSyAQrr5sdIFTWvHsuk8XozBkrHfo4YdeNrs";

abstract class AuthRemoteSource {
  Future<EmployeeEntity?> employeeSignIn(
      {required String email, required String password});
  Future<ManagerEntity?> managerSignIn(
      {required String email, required String password});
  Future<ManagerEntity> managerSignUp(ManagerRegisterParams params);
  Future<EmployeeEntity> employeeSignUp(EmployeeRegisterParams params);
  Future<ManagerInfoEntity> getDepartments(String params);
  // Future<JobTitlesEntity> getJobTitles(int params);
  Future<String> changePassword(ChangePasswordParams params);
  Future<Map<String, dynamic>> veridfyEmail(VerifyParams params);
  Future<Map<String, dynamic>> resetPassword(ResetPasswordParams params);
  Future<Map<String, dynamic>> forgetPassword(ForgetPasswordParams params);
  Future<void> deleteAccount(AccountDeleteParams params);
}

class AuthRemoteSourceImpl extends AuthRemoteSource {
  final Token token;

  AuthRemoteSourceImpl({required this.token});

  @override
  Future<EmployeeEntity> employeeSignIn(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${AppConsts.baseUrl}/employee/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    debugPrint(response.statusCode.toString() + response.body);

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        final jsn = jsonDecode(response.body);
        throw ServerFailure(jsn['message']);
      } else {
        return EmployeeEntity.fromJson(response.body);
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<EmployeeEntity> employeeSignUp(EmployeeRegisterParams params) async {
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConsts.baseUrl}/employee/register'),
    );
    request.headers.addAll({'Accept': 'application/json'});
    request.fields.addAll({
      'name': params.name,
      'email': params.email,
      'password': params.password,
      'password_confirmation': params.confirmPassword,
      'phone': params.phone,
      'address': params.address,
      'manager_pin': params.managerPin,
      'department_id': params.departmentId.toString(),
      'job_id': params.jobId.toString(),
      'office_id': params.officeId.toString()
    });
    final image = http.MultipartFile.fromBytes(
        'image', params.image.readAsBytesSync(),
        filename: params.image.path);
    request.files.add(image);
    final response = await request.send();
    debugPrint(response.statusCode.toString());
    String? body = await response.stream.bytesToString();
    if (response.statusCode < 400) {
      if (jsonDecode(body)['status'] == 0) {
        throw ServerFailure(jsonDecode(body)['message']);
      } else {
        return EmployeeEntity.fromJson(body);
      }
    } else if (response.statusCode >= 400) {
      throw ServerFailure(jsonDecode(body)['message']);
    } else {
      throw const ServerFailure("SignUp Exeption!");
    }
  }

  @override
  Future<ManagerEntity> managerSignUp(ManagerRegisterParams params) async {
    // print(params.toMap());
    final request = http.MultipartRequest(
      'POST',
      Uri.parse('${AppConsts.baseUrl}/manager/register'),
    );
    request.headers.addAll({'Accept': 'application/json'});
    request.fields.addAll({
      'name': params.name,
      'email': params.email,
      'password': params.password,
      'password_confirmation': params.passwordConfirmation,
      'phone': params.phone,
      'company_name': params.companyName,
    });
    final image = http.MultipartFile.fromBytes(
        'image', params.image.readAsBytesSync(),
        filename: params.image.path);
    request.files.add(image);
    final response = await request.send();
    String? body = await response.stream.bytesToString();
    debugPrint(response.statusCode.toString());
    debugPrint(body);
    if (response.statusCode < 400) {
      debugPrint('XXXXXXXXXXXXXXX$body');
      if (jsonDecode(body)['status'] == 0) {
        throw ServerFailure(jsonDecode(body)['message']);
      } else {
        return ManagerEntity.fromJson(jsonDecode(body));
      }
    } else if (response.statusCode >= 400) {
      throw ServerFailure(jsonDecode(body)['message']);
    } else {
      throw const ServerFailure("SignUp Exeption!");
    }
  }

  @override
  Future<ManagerInfoEntity> getDepartments(String params) async {
    final response = await http.post(
      Uri.parse('${AppConsts.baseUrl}/employee/managerInfoByUID'),
      headers: {'Accept': 'application/json'},
      body: {'uid': params},
    );
    debugPrint(response.statusCode.toString());

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return ManagerInfoEntity.fromJson(jsonDecode(response.body));
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  // @override
  // Future<JobTitlesEntity> getJobTitles(int params) async {
  //   final response = await http.post(
  //     Uri.parse('${AppConsts.baseUrl}/employee/getJobsByDepartment'),
  //     body: {'department_id': params.toString()},
  //   );
  //   debugPrint(response.statusCode.toString() + response.body);

  //   if (response.statusCode < 400) {
  //     debugPrint(response.body);
  //     if (jsonDecode(response.body)['status'] == 0) {
  //       throw ServerFailure(jsonDecode(response.body)['message']);
  //     } else {
  //       return JobTitlesEntity.fromJson(jsonDecode(response.body));
  //     }
  //   } else {
  //     throw ServerFailure(response.reasonPhrase ??
  //         "Sign in Exeption, Check connection and try again!");
  //   }
  // }

  @override
  Future<ManagerEntity?> managerSignIn(
      {required String email, required String password}) async {
    final response = await http.post(
      Uri.parse('${AppConsts.baseUrl}/manager/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    debugPrint(response.statusCode.toString() + response.body);

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return ManagerEntity.fromJson(jsonDecode(response.body));
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<String> changePassword(ChangePasswordParams params) async {
    final response = await http.post(
      Uri.parse('${AppConsts.baseUrl}/employee/changePassword'),
      headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer ${params.token}'
      },
      body: params.toMap(),
    );
    debugPrint(response.statusCode.toString() + response.body);

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return jsonDecode(response.body)['message'];
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<Map<String, dynamic>> veridfyEmail(VerifyParams params) async {
    final response = await http.post(
      Uri.parse(
          '${AppConsts.baseUrl}/${params.isEmployee ? 'employee' : 'manager'}/verifyMail'),
      headers: {
        'Accept': 'application/json',
      },
      body: params.toMap(),
    );
    debugPrint(response.statusCode.toString() + response.body);
    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return jsonDecode(response.body);
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<Map<String, dynamic>> resetPassword(ResetPasswordParams params) async {
    final response = await http.post(
      Uri.parse(
          '${AppConsts.baseUrl}/${params.isEmployee ? 'employee' : 'manager'}/resetPassword'),
      headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer ${params.token}'
      },
      body: params.toMap(),
    );
    debugPrint(response.statusCode.toString() + response.body);

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return jsonDecode(response.body);
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<Map<String, dynamic>> forgetPassword(
      ForgetPasswordParams params) async {
    final response = await http.post(
      Uri.parse(
          '${AppConsts.baseUrl}/${params.isEmployee ? 'employee' : 'manager'}/forgetPassword'),
      headers: {
        'Accept': 'application/json',
      },
      body: {'email': params.email},
    );
    debugPrint(response.statusCode.toString() + response.body);

    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return jsonDecode(response.body);
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }

  @override
  Future<void> deleteAccount(AccountDeleteParams params) async {
    final response = await http.delete(
      Uri.parse('${AppConsts.baseUrl}/mployee/deleteAccount'),
      headers: {
        'Accept': 'application/json',
        "Authorization": 'Bearer ${token.getToken} '
      },
      body: {
        'password': params.password,
      },
    );
    if (response.statusCode < 400) {
      debugPrint(response.body);
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerFailure(jsonDecode(response.body)['message']);
      } else {
        return;
      }
    } else {
      throw ServerFailure(response.reasonPhrase ??
          "Sign in Exeption, Check connection and try again!");
    }
  }
}
