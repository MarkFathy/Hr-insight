import 'package:equatable/equatable.dart';

class ManagerAttendanceEntity extends Equatable {
  final int? status;
  final String? message;
  final List<ManagerAttendanceDataEntity>? data;
  const ManagerAttendanceEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}

// class AttendanceDataEntity extends Equatable {
//   final int? id;
//   final int? employeeId;
//   final String? attendanceTime;
//   final double? lat;
//   final double? lng;
//   final String? createdAt;
//   final String? updatedAt;

//   const AttendanceDataEntity(
//       {this.id,
//       this.employeeId,
//       this.attendanceTime,
//       this.lat,
//       this.lng,
//       this.createdAt,
//       this.updatedAt});

//   @override
//   List<Object?> get props {
//     return [
//       id,
//       employeeId,
//       attendanceTime,
//       lat,
//       lng,
//       createdAt,
//       updatedAt,
//     ];
//   }
// }

class ManagerAttendanceDataEntity extends Equatable {
  final int? id;
  final String? date;
  final int? employeeId;
  final String? attendanceTime;
  final String? departureTime;
  final double? lat;
  final double? lng;
  final String? createdAt;
  final String? updatedAt;

  const ManagerAttendanceDataEntity(
      {this.id,
      this.date,
      this.employeeId,
      this.attendanceTime,
      this.departureTime,
      this.lat,
      this.lng,
      this.createdAt,
      this.updatedAt});

  @override
  List<Object?> get props {
    return [
      id,
      date,
      employeeId,
      attendanceTime,
      departureTime,
      lat,
      lng,
      createdAt,
      updatedAt,
    ];
  }
}
