import 'package:equatable/equatable.dart';

class SignEntity extends Equatable {
  final int? status;
  final String? message;
  final String? data;

  const SignEntity({this.status, this.message, this.data});

  @override
  List<Object?> get props => [status, message, data];
}
