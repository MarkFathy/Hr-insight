// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart' as intl;

class AttendanceEntity extends Equatable {
  final int? status;
  final String? message;
  final List<AttendanceDataEntity>? data;

  const AttendanceEntity({this.status, this.message, this.data});

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

class AttendanceDataEntity extends Equatable {
  final int? id;
  final String? date;
  final int? employeeId;
  final String? attendanceTime;
  final String? departureTime;
  final double? lat;
  final double? lng;
  final String? createdAt;
  final String? updatedAt;

  const AttendanceDataEntity(
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


  String? getAdjustedAttendanceTime() {
    if (attendanceTime != null) {
      DateTime parsedTime = intl.DateFormat('HH:mm:ss').parse(attendanceTime!);

      DateTime adjustedTime = parsedTime.add(Duration(hours: 3));

      return intl.DateFormat('HH:mm:ss').format(adjustedTime);
    }
    return null;
  }
}
