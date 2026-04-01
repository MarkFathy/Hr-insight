import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/authentication/domain/entities/employee_entity.dart';

class OfficeDetailsEntity extends Equatable {
  final int? status;
  final String? message;
  final OfficeDetailsDataEntity? data;

  const OfficeDetailsEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.toMap(),
    };
  }

  factory OfficeDetailsEntity.fromMap(Map<String, dynamic> map) {
    return OfficeDetailsEntity(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? OfficeDetailsDataEntity.fromMap(map['data'])
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeDetailsEntity.fromJson(String source) =>
      OfficeDetailsEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class OfficeDetailsDataEntity extends Equatable {
  final int? id;
  final String? name;
  final double? lat;
  final double? lng;
  final double? radius;
  final List<EmployeeDataEntity>? employees;
  final int? managerId;
  final String? createdAt;
  final String? updatedAt;

  const OfficeDetailsDataEntity(
      {this.id,
      this.name,
      this.lat,
      this.lng,
      this.radius,
      this.managerId,
      this.createdAt,
      this.updatedAt,
      this.employees});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      lat,
      lng,
      radius,
      managerId,
      employees,
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
      'employees': employees
    };
  }

  factory OfficeDetailsDataEntity.fromMap(Map<String, dynamic> map) {
    return OfficeDetailsDataEntity(
        id: map['id'] != null ? map['id'] as int : null,
        name: map['name'] != null ? map['name'] as String : null,
        lat: map['lat'] != null ? (map['lat'] as num).toDouble() : null,
        lng: map['lng'] != null ? (map['lng'] as num).toDouble() : null,
        radius: map['radius'] != null ? map['radius'] as double : null,
        managerId: map['manager_id'] != null ? map['manager_id'] as int : null,
        createdAt:
            map['created_at'] != null ? map['created_at'] as String : null,
        updatedAt:
            map['updated_at'] != null ? map['updated_at'] as String : null,
        employees: map['employees'] != null
            ? List<EmployeeDataEntity>.from(
                (map['employees'] as List).map<EmployeeDataEntity?>(
                  (x) => EmployeeDataEntity.fromMap(x as Map<String, dynamic>),
                ),
              )
            : []);
  }

  String toJson() => json.encode(toMap());

  factory OfficeDetailsDataEntity.fromJson(String source) =>
      OfficeDetailsDataEntity.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
