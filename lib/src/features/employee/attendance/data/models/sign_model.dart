import 'dart:convert';

import 'package:hr_app/src/features/employee/attendance/domain/entities/sign_entity.dart';

class SignModel extends SignEntity {
  const SignModel({super.status, super.message, super.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data,
    };
  }

  factory SignModel.fromMap(Map<String, dynamic> map) {
    return SignModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null ? map['data'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignModel.fromJson(String source) =>
      SignModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
