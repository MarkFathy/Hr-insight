import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';

class EmployeeEntity extends Equatable {
  final int? status;
  final String? message;
  final UserDataEntity? data;

  const EmployeeEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data?.toMap(),
    };
  }

  factory EmployeeEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeEntity(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? UserDataEntity.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeEntity.fromJson(String source) =>
      EmployeeEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class UserDataEntity extends Equatable {
  final String? token;
  final EmployeeDataEntity? employee;

  const UserDataEntity({this.token, this.employee});

  @override
  List<Object?> get props => [token, employee];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'token': token,
      'data': employee?.toMap(),
    };
  }

  factory UserDataEntity.fromMap(Map<String, dynamic> map) {
    return UserDataEntity(
      token: map['token'] != null ? map['token'] as String : null,
      employee: map['data'] != null
          ? EmployeeDataEntity.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserDataEntity.fromJson(String source) =>
      UserDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class EmployeeDataEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? address;
  final String? image;
  final String? uID;
  final String? updatedAt;
  final String? createdAt;
  final int? id;
  final ManagerDataEntity? manager;
  final JobEntity? job;
  final DepartmentDataEntity? department;
  final OfficeDataEntity? office;

  const EmployeeDataEntity(
      {this.name,
      this.email,
      this.phone,
      this.address,
      this.uID,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.manager,
      this.job,
      this.department,
      this.office,
      this.image});

  @override
  List<Object?> get props {
    return [
      name,
      email,
      phone,
      address,
      uID,
      updatedAt,
      createdAt,
      id,
      manager,
      job,
      department,
      office,
      image
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'UID': uID,
      'updated_at': updatedAt,
      'created_at': createdAt,
      'id': id,
      'manager': manager?.toJson(),
      'job': job?.toMap(),
      'department': department?.toMap(),
      'office': office?.toMap(),
      'image': image
    };
  }

  factory EmployeeDataEntity.fromMap(Map<String, dynamic> map) {
    return EmployeeDataEntity(
      name: map['name'] != null ? map['name'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      uID: map['UID'] != null ? map['UID'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      id: map['id'] != null ? map['id'] as int : null,
      image: map['image'] != null ? map['image'] as String : null,
      manager: map['manager'] != null
          ? ManagerDataEntity.fromJson(map['manager'] as Map<String, dynamic>)
          : null,
      job: map['job'] != null
          ? JobEntity.fromMap(map['job'] as Map<String, dynamic>)
          : null,
      department: map['department'] != null
          ? DepartmentDataEntity.fromMap(
              map['department'] as Map<String, dynamic>)
          : null,
      office: map['office'] != null
          ? OfficeDataEntity.fromMap(map['office'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory EmployeeDataEntity.fromJson(String source) =>
      EmployeeDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class JobEntity extends Equatable {
  final int? id;
  final String? title;
  final int? departmentId;
  final String? createdAt;
  final String? updatedAt;

  const JobEntity(
      {this.id, this.title, this.departmentId, this.createdAt, this.updatedAt});

  @override
  List<Object?> get props {
    return [
      id,
      title,
      departmentId,
      createdAt,
      updatedAt,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'department_id': departmentId,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  factory JobEntity.fromMap(Map<String, dynamic> map) {
    return JobEntity(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      departmentId:
          map['department_id'] != null ? map['department_id'] as int : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobEntity.fromJson(String source) =>
      JobEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
