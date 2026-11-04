import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_employee_params.freezed.dart';
part 'set_employee_params.g.dart';

@freezed
abstract class SetEmployeeParams with _$SetEmployeeParams {
  const SetEmployeeParams._();

  const factory SetEmployeeParams({
    @JsonKey(name: 'employee_id') required int employeeId,
    @JsonKey(name: 'office_id') int? officeId,
    @JsonKey(name: 'job_id') int? jobId,
  }) = _SetEmployeeParams;

  factory SetEmployeeParams.fromJson(Map<String, dynamic> json) =>
      _$SetEmployeeParamsFromJson(json);

  Map<String, dynamic> toMap() => {
    'office_id': officeId?.toString(),
    'employee_id': employeeId.toString(),
    'job_id': jobId?.toString(),
  };

  factory SetEmployeeParams.fromMap(Map<String, dynamic> map) =>
      SetEmployeeParams(
        officeId: map['office_id'] as int?,
        employeeId: map['employee_id'] as int,
        jobId: map['job_id'] as int?,
      );
}
