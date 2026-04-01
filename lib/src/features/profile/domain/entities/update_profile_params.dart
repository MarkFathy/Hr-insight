import "dart:convert";
import "package:equatable/equatable.dart";

class UpdateProfileParams extends Equatable {
  final int? id;
  final bool? status;

  const UpdateProfileParams({required this.id, required this.status});

  @override
  List<Object?> get props => [id, status];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      "leave_id": id,
      "status": status,
    };
  }

  factory UpdateProfileParams.fromMap(Map<String, dynamic> map) {
    return UpdateProfileParams(
        id: map["leave_id"] != null ? map["leave_id"] as int : null,
        status: map["status"]);
  }

  String toJson() => json.encode(toMap());

  factory UpdateProfileParams.fromJson(String source) =>
      UpdateProfileParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
