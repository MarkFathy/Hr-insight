// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class OfficeParams extends Equatable {
  final int? id;
  final String? name;
  final double? radius;
  final double? lat;
  final double? lng;

  const OfficeParams(
      {required this.name,
      required this.radius,
      required this.lat,
      required this.lng,
      this.id});

  @override
  List<Object?> get props => [name, radius, lat, lng, id];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'radius': radius.toString(),
      'lat': lat.toString(),
      'lng': lng.toString(),
    };
  }

  factory OfficeParams.fromMap(Map<String, dynamic> map) {
    return OfficeParams(
      name: map['name'] as String,
      radius: map['radius'] as double,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfficeParams.fromJson(String source) =>
      OfficeParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
