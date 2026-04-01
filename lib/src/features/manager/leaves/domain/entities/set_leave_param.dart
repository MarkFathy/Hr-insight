import "dart:convert";
import "package:equatable/equatable.dart";

class SetLeaveParams extends Equatable {
  final int? id;
  final String? status;

  const SetLeaveParams({required this.id, required this.status});

  @override
  List<Object?> get props => [id, status];

  // Convert object to map
  Map<String, dynamic> toMap() {
    return {
      "leave_id": id,
      "status": status,
    };
  }

  // Create object from map
  factory SetLeaveParams.fromMap(Map<String, dynamic> map) {
    return SetLeaveParams(
      id: map["leave_id"] != null ? map["leave_id"] as int : null,
      status: map["status"] != null ? map["status"] as String : null,
    );
  }

  // Convert object to JSON string
  String toJson() => json.encode(toMap());

  // Create object from JSON string
  factory SetLeaveParams.fromJson(String source) =>
      SetLeaveParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
