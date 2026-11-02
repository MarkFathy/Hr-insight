// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'attendance_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AttendanceEntity _$AttendanceEntityFromJson(Map<String, dynamic> json) =>
    _AttendanceEntity(
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AttendanceDataEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AttendanceEntityToJson(_AttendanceEntity instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };

_AttendanceDataEntity _$AttendanceDataEntityFromJson(
  Map<String, dynamic> json,
) => _AttendanceDataEntity(
  id: (json['id'] as num?)?.toInt(),
  date: json['date'] as String?,
  employeeId: (json['employee_id'] as num?)?.toInt(),
  attendanceTime: json['attendance_time'] as String?,
  departureTime: json['departure_time'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  createdAt: json['created_at'] as String?,
  updatedAt: json['updated_at'] as String?,
);

Map<String, dynamic> _$AttendanceDataEntityToJson(
  _AttendanceDataEntity instance,
) => <String, dynamic>{
  'id': instance.id,
  'date': instance.date,
  'employee_id': instance.employeeId,
  'attendance_time': instance.attendanceTime,
  'departure_time': instance.departureTime,
  'lat': instance.lat,
  'lng': instance.lng,
  'created_at': instance.createdAt,
  'updated_at': instance.updatedAt,
};
