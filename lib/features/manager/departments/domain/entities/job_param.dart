import 'package:freezed_annotation/freezed_annotation.dart';

part 'job_param.freezed.dart';
part 'job_param.g.dart';

@freezed
abstract class JobParams with _$JobParams {
  const JobParams._();

  const factory JobParams({
    required String? title, @JsonKey(name: 'job_id') int? jobId,
    @JsonKey(name: 'department_id') int? departmentId,
  }) = _JobParams;

  factory JobParams.fromJson(Map<String, dynamic> json) =>
      _$JobParamsFromJson(json);

  Map<String, dynamic> toMap() => {
    'job_id': jobId?.toString(),
    'department_id': departmentId?.toString(),
    'title': title,
  };

  factory JobParams.fromMap(Map<String, dynamic> map) => JobParams(
    jobId: map['job_id'] != null ? map['job_id'] as int? : null,
    departmentId: map['department_id'] != null
        ? map['department_id'] as int?
        : null,
    title: map['title'] as String?,
  );
}
