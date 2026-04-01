import 'dart:convert';
import 'package:hr_app/src/features/manager/manager_attendance/domain/entities/manager_attendance_entity.dart';

class ManagerAttendanceModel extends ManagerAttendanceEntity {
  const ManagerAttendanceModel({super.status, super.message, super.data});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data':
          data!.map((x) => (x as ManagerAttendanceDataModel).toJson()).toList(),
    };
  }

  factory ManagerAttendanceModel.fromMap(Map<String, dynamic> map) {
    return ManagerAttendanceModel(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<ManagerAttendanceDataModel>.from(
              (map['data'] as List).map<ManagerAttendanceDataModel?>(
                (x) => ManagerAttendanceDataModel.fromJson(x),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ManagerAttendanceModel.fromJson(String source) =>
      ManagerAttendanceModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class ManagerAttendanceDataModel extends ManagerAttendanceDataEntity {
  const ManagerAttendanceDataModel(
      {super.id,
      super.date,
      super.employeeId,
      super.attendanceTime,
      super.departureTime,
      super.lat,
      super.lng,
      super.createdAt,
      super.updatedAt});

  factory ManagerAttendanceDataModel.fromJson(Map<String, dynamic> json) {
    return ManagerAttendanceDataModel(
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
