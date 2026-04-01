// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SignParams {
  final bool isAttend;
  final double lat;
  final double lng;

  SignParams({required this.isAttend, required this.lat, required this.lng});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isAttend': isAttend,
      'lat': lat,
      'lng': lng,
    };
  }

  factory SignParams.fromMap(Map<String, dynamic> map) {
    return SignParams(
      isAttend: map['isAttend'] as bool,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory SignParams.fromJson(String source) =>
      SignParams.fromMap(json.decode(source) as Map<String, dynamic>);
}
