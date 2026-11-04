import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_leave_param.freezed.dart';
part 'set_leave_param.g.dart';

@freezed
abstract class SetLeaveParams with _$SetLeaveParams {
  const SetLeaveParams._();

  const factory SetLeaveParams({
    @JsonKey(name: 'leave_id') required int? id,
    required String? status,
  }) = _SetLeaveParams;

  factory SetLeaveParams.fromJson(Map<String, dynamic> json) =>
      _$SetLeaveParamsFromJson(json);

  Map<String, dynamic> toMap() => {'leave_id': id, 'status': status};

  factory SetLeaveParams.fromMap(Map<String, dynamic> map) => SetLeaveParams(
    id: map['leave_id'] as int?,
    status: map['status'] as String?,
  );
}
