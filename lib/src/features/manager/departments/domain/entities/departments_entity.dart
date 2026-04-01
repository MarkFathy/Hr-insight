import 'dart:convert';

import 'package:equatable/equatable.dart';

class DepartmentsEntity extends Equatable {
  final int? status;
  final String? message;
  final List<DepartmentDataEntity>? data;

  const DepartmentsEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message': message,
      'data': data!.map((x) => x.toMap()).toList(),
    };
  }

  factory DepartmentsEntity.fromMap(Map<String, dynamic> map) {
    return DepartmentsEntity(
      status: map['status'] != null ? map['status'] as int : null,
      message: map['message'] != null ? map['message'] as String : null,
      data: map['data'] != null
          ? List<DepartmentDataEntity>.from(
              (map['data'] as List).map<DepartmentDataEntity?>(
                (x) => DepartmentDataEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentsEntity.fromJson(String source) =>
      DepartmentsEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class DepartmentDataEntity extends Equatable {
  final int? id;
  final String? name;
  final int? managerId;
  final String? createdAt;
  final String? updatedAt;
  final int? jobsCount;
  final int? numberOfEmployees;
  final List<JobDataEntity>? jobs;

  const DepartmentDataEntity(
      {this.id,
      this.name,
      this.managerId,
      this.createdAt,
      this.updatedAt,
      this.jobsCount,
      this.numberOfEmployees,
      this.jobs});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      managerId,
      createdAt,
      updatedAt,
      jobsCount,
      numberOfEmployees,
      jobs,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'manager_id': managerId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'jobs_count': jobsCount,
      'number_of_employees': numberOfEmployees,
      'jobs': jobs != null ? jobs!.map((x) => x.toMap()).toList() : null,
    };
  }

  factory DepartmentDataEntity.fromMap(Map<String, dynamic> map) {
    return DepartmentDataEntity(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      managerId: map['manager_id'] != null ? map['manager_id'] as int : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      jobsCount: map['jobs_count'] != null ? map['jobs_count'] as int : null,
      numberOfEmployees: map['number_of_employees'] != null
          ? map['number_of_employees'] as int
          : null,
      jobs: map['jobs'] != null
          ? List<JobDataEntity>.from(
              (map['jobs'] as List).map<JobDataEntity?>(
                (x) => JobDataEntity.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory DepartmentDataEntity.fromJson(String source) =>
      DepartmentDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}

class JobDataEntity extends Equatable {
  final int? id;
  final String? title;
  final int? departmentId;
  final int? managerId;
  final String? createdAt;
  final String? updatedAt;
  final int? employeesCount;

  const JobDataEntity(
      {this.id,
      this.title,
      this.departmentId,
      this.managerId,
      this.createdAt,
      this.updatedAt,
      this.employeesCount});

  @override
  List<Object?> get props {
    return [
      id,
      title,
      departmentId,
      managerId,
      createdAt,
      updatedAt,
      employeesCount,
    ];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'department_id': departmentId,
      'manager_id': managerId,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'employees_count': employeesCount,
    };
  }

  factory JobDataEntity.fromMap(Map<String, dynamic> map) {
    return JobDataEntity(
      id: map['id'] != null ? map['id'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
      departmentId:
          map['department_id'] != null ? map['department_id'] as int : null,
      managerId: map['manager_id'] != null ? map['manager_id'] as int : null,
      createdAt: map['created_at'] != null ? map['created_at'] as String : null,
      updatedAt: map['updated_at'] != null ? map['updated_at'] as String : null,
      employeesCount:
          map['employees_count'] != null ? map['employees_count'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobDataEntity.fromJson(String source) =>
      JobDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
