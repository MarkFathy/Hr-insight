import 'dart:convert';

import 'package:hr_app/src/features/employee/leaves/domain/entities/leaves_entity.dart';

class LeavesModel extends LeavesEntity {
  const LeavesModel({super.status, super.message, super.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.map((x) => (x as LeavesDataModel).toMap()).toList(),
    };
  }

  factory LeavesModel.fromMap(Map<String, dynamic> map) {
    return LeavesModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? map['data'] is List // Check if 'data' is a list
              ? List<LeavesDataModel>.from(
                  (map['data'] as List).map<LeavesDataModel>(
                    (x) => LeavesDataModel.fromMap(x as Map<String, dynamic>),
                  ),
                )
              : [
                  LeavesDataModel.fromMap(map['data'] as Map<String, dynamic>)
                ] // Wrap single map as list
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory LeavesModel.fromJson(String source) =>
      LeavesModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class LeavesDataModel extends LeavesDataEntity {
  const LeavesDataModel({
    super.id,
    super.employeeId,
    super.managerId,
    super.dayDate,
    super.from,
    super.to,
    super.leaveType,
    super.status,
    super.notes,
    super.createdAt,
    super.updatedAt,
  });

  factory LeavesDataModel.fromMap(Map<String, dynamic> json) {
    return LeavesDataModel(
      id: json['id'] as int?,
      employeeId: json['employee_id'] as int?,
      managerId: json['manager_id'] as int?,
      dayDate:
          json['day_date'] != null ? DateTime.parse(json['day_date']) : null,
      from: json['from'] != null ? DateTime.parse(json['from']) : null,
      to: json['to'] != null ? DateTime.parse(json['to']) : null,
      leaveType: json['leave_type'] as String?,
      status: json['status'],
      notes: json['notes'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'employee_id': employeeId,
      'manager_id': managerId,
      'day_date': dayDate?.toIso8601String(),
      'from': from?.toIso8601String(),
      'to': to?.toIso8601String(),
      'leave_type': leaveType,
      'status': status,
      'notes': notes, // Can be null
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  String toJson() => json.encode(toMap());

  factory LeavesDataModel.fromJson(String source) =>
      LeavesDataModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
