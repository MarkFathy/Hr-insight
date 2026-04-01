import 'dart:convert';

import 'package:equatable/equatable.dart';

class DepartmentsParams extends Equatable {
  final int? id;
  final String? name;

  const DepartmentsParams({required this.name, this.id});

  @override
  List<Object?> get props => [name, id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory DepartmentsParams.fromMap(Map<String, dynamic> map) {
    return DepartmentsParams(name: map['name'] as String, id: map['id'] as int);
  }

  String toJson() => json.encode(toMap());

  factory DepartmentsParams.fromJson(String source) =>
      DepartmentsParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
