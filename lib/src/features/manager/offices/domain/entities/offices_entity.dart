// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OfficesEntity extends Equatable {
  final int? status;
  final String? message;
  final List<OfficeDataEntity>? data;

  const OfficesEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory OfficesEntity.fromMap(Map<String, dynamic> map) {
    return OfficesEntity(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<OfficeDataEntity>.from(
              (map['data'] as List).map<OfficeDataEntity?>(
                (x) => OfficeDataEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficesEntity.fromJson(String source) =>
      OfficesEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OfficeDataEntity extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lng;
  final double? radius;
  final int? employeeCount;
  final int? managerId;
  final String? createdAt;
  final String? updatedAt;

  const OfficeDataEntity(
      {this.id,
      this.name,
      this.lat,
      this.lng,
      this.radius,
      this.managerId,
      this.createdAt,
      this.updatedAt,
      this.employeeCount});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      lat,
      lng,
      radius,
      managerId,
      employeeCount,
      createdAt,
      updatedAt,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'lat': lat,
      'lng': lng,
      'radius': radius,
      'manager_id': managerId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'employees_count': employeeCount ?? 0
    };
  }

  factory OfficeDataEntity.fromMap(Map<String, dynamic> map) {
    return OfficeDataEntity(
        id: map['id'] != null ? map['id'] as int : null,
        name: map['name'] != null ? map['name'] as String : null,
        lat: map['lat'] != null ? (map['lat'] as num).toDouble() : null,
        lng: map['lng'] != null ? (map['lng'] as num).toDouble() : null,
        radius:
            map['radius'] != null ? (map['radius'] as num).toDouble() : null,
        managerId: map['manager_id'] != null ? map['manager_id'] as int : null,
        createdAt:
            map['created_at'] != null ? map['created_at'] as String : null,
        updatedAt:
            map['updated_at'] != null ? map['updated_at'] as String : null,
        employeeCount: map['employees_count'] != null
            ? map['employees_count'] as int
            : null);
  }

  String toJson() => json.encode(toMap());

  factory OfficeDataEntity.fromJson(String source) =>
      OfficeDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
