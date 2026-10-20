import 'package:freezed_annotation/freezed_annotation.dart';

part 'departments_params.freezed.dart';
part 'departments_params.g.dart';

@freezed
abstract class DepartmentsParams with _$DepartmentsParams {
  const DepartmentsParams._();

  const factory DepartmentsParams({required String? name, int? id}) =
      _DepartmentsParams;

  factory DepartmentsParams.fromJson(Map<String, dynamic> json) =>
      _$DepartmentsParamsFromJson(json);

  Map<String, dynamic> toMap() => {'id': id, 'name': name};

  factory DepartmentsParams.fromMap(Map<String, dynamic> map) =>
      DepartmentsParams(name: map['name'] as String?, id: map['id'] as int?);
}
