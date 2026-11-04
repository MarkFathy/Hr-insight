import 'package:freezed_annotation/freezed_annotation.dart';

part 'leave_params.freezed.dart';
part 'leave_params.g.dart';

@freezed
abstract class LeaveParams with _$LeaveParams {
  const LeaveParams._();

  const factory LeaveParams({
    required String? notes,
    required DateTime? from,
    required DateTime? to,
    @JsonKey(name: 'leave_type') required String? leaveType,
  }) = _LeaveParams;

  factory LeaveParams.fromJson(Map<String, dynamic> json) =>
      _$LeaveParamsFromJson(json);

  Map<String, dynamic> toMap() => {
    'notes': notes,
    'from': from?.toIso8601String(),
    'to': to?.toIso8601String(),
    'leave_type': leaveType,
  };

  factory LeaveParams.fromMap(Map<String, dynamic> map) => LeaveParams(
    notes: map['notes'] != null ? map['notes'] as String : null,
    from: map['from'] != null ? DateTime.parse(map['from'] as String) : null,
    to: map['to'] != null ? DateTime.parse(map['to'] as String) : null,
    leaveType: map['leave_type'] != null ? map['leave_type'] as String : null,
  );
}
