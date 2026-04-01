import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/manager/leaves/domain/entities/set_leave_param.dart';
import 'package:http/http.dart' as http;

abstract class ManagerLeavesRemoteDataSrc {
  Future<LeavesModel> fetchLeaves();
  Future<LeavesModel> setLeave(SetLeaveParams params);
}

class ManagerLeavesRemoteDataSrcImpl implements ManagerLeavesRemoteDataSrc {
  final Token token;
  final http.Client client;

  ManagerLeavesRemoteDataSrcImpl({required this.client, required this.token});
  @override
  Future<LeavesModel> fetchLeaves() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/manager/leaves"),
      headers: {
        "Accept": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      }
      return LeavesModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<LeavesModel> setLeave(SetLeaveParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/acceptRejectLeave"),
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": 'Bearer ${token.getToken}',
          "Connection": "keep-alive",
        },
        body: jsonEncode(params.toMap()));
    // print(response.body);
    // print(response.statusCode);
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      }
      return LeavesModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
