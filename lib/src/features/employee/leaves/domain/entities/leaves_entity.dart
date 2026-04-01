import 'package:equatable/equatable.dart';

class LeavesEntity extends Equatable {
  final int? status;
  final String? message;
  final List<LeavesDataEntity>? data;

  const LeavesEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}

class LeavesDataEntity extends Equatable {
  final int? id;
  final int? employeeId;
  final int? managerId;
  final DateTime? dayDate;
  final DateTime? from;
  final DateTime? to;
  final String? leaveType;
  final String?
      status; // Updated to String to represent status like "approved", "pending", etc.
  final String? notes;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const LeavesDataEntity({
    this.id,
    this.employeeId,
    this.managerId,
    this.dayDate,
    this.from,
    this.to,
    this.leaveType,
    this.status,
    this.notes,
    this.createdAt,
    this.updatedAt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      employeeId,
      managerId,
      dayDate,
      from,
      to,
      leaveType,
      status,
      notes,
      createdAt,
      updatedAt,
    ];
  }
}
