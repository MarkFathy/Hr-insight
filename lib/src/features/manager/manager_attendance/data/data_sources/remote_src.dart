import 'dart:convert';
import 'package:hr_app/src/core/consts/consts.dart';
import 'package:hr_app/src/core/error/exceptions.dart';
import 'package:hr_app/src/core/public_models/token.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_model.dart';
import 'package:hr_app/src/features/manager/manager_attendance/data/models/attendance_params.dart';
import 'package:http/http.dart' as http;

abstract class ManagerAttendanceRemoteDataSrc {
  Future<ManagerAttendanceModel> fetchAttendance(ManagerAttendanceParams date);
}

class ManagerAttendanceRemoteDataSrcImpl
    implements ManagerAttendanceRemoteDataSrc {
  final Token token;
  final http.Client client;

  ManagerAttendanceRemoteDataSrcImpl(
      {required this.client, required this.token});
  @override
  Future<ManagerAttendanceModel> fetchAttendance(
      ManagerAttendanceParams params) async {
    final response = await client.post(
        Uri.parse("${AppConsts.baseUrl}/manager/AttendanceList"),
        headers: {
          "Accept": "application/json",
          "Authorization": 'Bearer ${token.getToken}'
        },
        body: params.toMap());

    if (response.statusCode < 400) {
      return ManagerAttendanceModel.fromJson(response.body);
    } else {
      throw ServerException(json.decode(response.body)['message']);
    }
  }
}
