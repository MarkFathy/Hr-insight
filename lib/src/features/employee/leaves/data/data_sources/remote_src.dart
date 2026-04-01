import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import 'package:hr_app/src/features/employee/leaves/domain/entities/leave_params.dart';
import 'package:http/http.dart' as http;

abstract class LeavesRemoteDataSrc {
  Future<LeavesModel> fetchLeaves();
  Future<void> requestLeave(LeaveParams params);
}

class LeavesRemoteDataSrcImpl implements LeavesRemoteDataSrc {
  final Token token;
  final http.Client client;

  LeavesRemoteDataSrcImpl({required this.client, required this.token});
  @override
  Future<LeavesModel> fetchLeaves() async {
    final response = await client.get(
      Uri.parse("${AppConsts.baseUrl}/employee/leavesList"),
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": 'Bearer ${token.getToken}'
      },
    );

    if (response.statusCode < 400) {
      return LeavesModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }

  @override
  Future<void> requestLeave(LeaveParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/employee/leave"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: params.toMap());
    if (response.statusCode < 400) {
      if (jsonDecode(response.body)['status'] == 0) {
        throw ServerException(jsonDecode(response.body)['message']);
      }
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
