import 'dart:convert';
import 'package:hr_app/src/features/authentication/domain/entities/manager_entity.dart';
import 'package:hr_app/src/features/manager/departments/domain/entities/departments_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';

class ManagerInfoEntity {
  int? status;
  String? message;
  ManageInfoDataEntity? data;

  ManagerInfoEntity({this.status, this.message, this.data});

  ManagerInfoEntity.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = ManageInfoDataEntity.fromMap(json['data']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> map = {};
    map['status'] = status;
    map['message'] = message;
    map['data'] = data!.toMap();
    return map;
  }
}

class ManageInfoDataEntity {
  final List<DepartmentDataEntity> departments;
  final List<OfficeDataEntity> offices;
  final ManagerDataEntity manager;

  ManageInfoDataEntity(
      {required this.departments,
      required this.offices,
      required this.manager});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'departments': departments.map((x) => x.toMap()).toList(),
      'offices': offices.map((x) => x.toMap()).toList(),
      'manager': manager.toJson(),
    };
  }

  factory ManageInfoDataEntity.fromMap(Map<String, dynamic> map) {
    return ManageInfoDataEntity(
      departments: List<DepartmentDataEntity>.from(
        (map['departments'] as List).map<DepartmentDataEntity>(
          (x) => DepartmentDataEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      offices: List<OfficeDataEntity>.from(
        (map['offices'] as List).map<OfficeDataEntity>(
          (x) => OfficeDataEntity.fromMap(x as Map<String, dynamic>),
        ),
      ),
      manager:
          ManagerDataEntity.fromJson(map['manager'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ManageInfoDataEntity.fromJson(String source) =>
      ManageInfoDataEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
