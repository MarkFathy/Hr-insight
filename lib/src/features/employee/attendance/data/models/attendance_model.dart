import 'dart:convert';

import 'package:hr_app/src/features/employee/attendance/domain/entities/attendance_entity.dart';

class AttendanceModel extends AttendanceEntity {
  const AttendanceModel({super.status, super.message, super.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.map((x) => (x as AttendanceDataModel).toJson()).toList(),
    };
  }

  factory AttendanceModel.fromMap(Map<String, dynamic> map) {
    return AttendanceModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<AttendanceDataModel>.from(
              (map['data'] as List).map<AttendanceDataModel?>(
                (x) => AttendanceDataModel.fromJson(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AttendanceModel.fromJson(String source) =>
      AttendanceModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class AttendanceDataModel extends AttendanceDataEntity {
  const AttendanceDataModel(
      {super.id,
      super.date,
      super.employeeId,
      super.attendanceTime,
      super.departureTime,
      super.lat,
      super.lng,
      super.createdAt,
      super.updatedAt});

  factory AttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return AttendanceDataModel(
        id: json['id'],
        date: json['date'],
        employeeId: json['employee_id'],
        attendanceTime: json['attendance_time'],
        departureTime: json['departure_time'],
        lat: json['lat'],
        lng: json['lng'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['date'] = date;
    data['employee_id'] = employeeId;
    data['attendance_time'] = attendanceTime;
    data['departure_time'] = departureTime;
    data['lat'] = lat;
    data['lng'] = lng;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }


}


