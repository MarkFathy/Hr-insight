import 'dart:convert';

import 'package:equatable/equatable.dart';

class SetOfficeParams extends Equatable {
  final int? officeId;
  final int employeeId;
  const SetOfficeParams({this.officeId, required this.employeeId});

  @override
  List<Object?> get props => [officeId, employeeId];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'office_id': officeId.toString(),
      'employee_id': employeeId.toString(),
    };
  }

  factory SetOfficeParams.fromMap(Map<String, dynamic> map) {
    return SetOfficeParams(
      officeId: map['office_id'] as int?,
      employeeId: map['employee_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory SetOfficeParams.fromJson(String source) =>
      SetOfficeParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
