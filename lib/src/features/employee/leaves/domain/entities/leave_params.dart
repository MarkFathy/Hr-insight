import 'dart:convert';
import 'package:equatable/equatable.dart';

class LeaveParams extends Equatable {
  final String? notes;
  final DateTime? from;
  final DateTime? to;
  final String? leaveType;

  const LeaveParams({
    required this.notes,
    required this.from,
    required this.to,
    required this.leaveType,
  });

  @override
  List<Object?> get props => [notes, from, to, leaveType];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'notes': notes,
      'from': from?.toIso8601String(), // Safely handle null DateTime
      'to': to?.toIso8601String(), // Safely handle null DateTime
      'leave_type': leaveType,
    };
  }

  factory LeaveParams.fromMap(Map<String, dynamic> map) {
    return LeaveParams(
      notes: map['notes'] != null ? map['notes'] as String : null,
      from: map['from'] != null ? DateTime.parse(map['from'] as String) : null,
      to: map['to'] != null ? DateTime.parse(map['to'] as String) : null,
      leaveType: map['leave_type'] != null ? map['leave_type'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaveParams.fromJson(String source) =>
      LeaveParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
