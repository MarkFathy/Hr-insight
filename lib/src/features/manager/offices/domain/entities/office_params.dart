import 'package:freezed_annotation/freezed_annotation.dart';

part 'office_params.freezed.dart';
part 'office_params.g.dart';

@freezed
abstract class OfficeParams with _$OfficeParams {
  const OfficeParams._();

  const factory OfficeParams({
    required String? name, required double? radius, required double? lat, required double? lng, int? id,
  }) = _OfficeParams;

  factory OfficeParams.fromJson(Map<String, dynamic> json) =>
      _$OfficeParamsFromJson(json);

  Map<String, dynamic> toMap() => {
    'name': name,
    'radius': radius?.toString(),
    'lat': lat?.toString(),
    'lng': lng?.toString(),
  };

  factory OfficeParams.fromMap(Map<String, dynamic> map) => OfficeParams(
    name: map['name'] as String?,
    radius: (map['radius'] as num?)?.toDouble(),
    lat: (map['lat'] as num?)?.toDouble(),
    lng: (map['lng'] as num?)?.toDouble(),
    id: map['id'] as int?,
  );
}
