// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class JobParams extends Equatable {
  final int? jobId;
  final int? departmentId;
  final String? title;

  const JobParams(
      {required this.title, required this.jobId, required this.departmentId});

  @override
  List<Object?> get props => [title, jobId];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'job_id': jobId.toString(),
      'department_id': departmentId.toString(),
      'title': title,
    };
  }

  factory JobParams.fromMap(Map<String, dynamic> map) {
    return JobParams(
      jobId: map['job_id'] != null ? map['jobId'] as int : null,
      departmentId:
          map['department_id'] != null ? map['departmentId'] as int : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory JobParams.fromJson(String source) =>
      JobParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
