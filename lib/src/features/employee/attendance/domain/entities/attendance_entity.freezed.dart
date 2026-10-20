// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'attendance_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AttendanceEntity {

 int? get status; String? get message; List<AttendanceDataEntity>? get data;
/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceEntityCopyWith<AttendanceEntity> get copyWith => _$AttendanceEntityCopyWithImpl<AttendanceEntity>(this as AttendanceEntity, _$identity);

  /// Serializes this AttendanceEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as AttendanceEntity;
  return 'AttendanceEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $AttendanceEntityCopyWith<$Res>  {
  factory $AttendanceEntityCopyWith(AttendanceEntity value, $Res Function(AttendanceEntity) _then) = _$AttendanceEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, List<AttendanceDataEntity>? data
});




}
/// @nodoc
class _$AttendanceEntityCopyWithImpl<$Res>
    implements $AttendanceEntityCopyWith<$Res> {
  _$AttendanceEntityCopyWithImpl(this._self, this._then);

  final AttendanceEntity _self;
  final $Res Function(AttendanceEntity) _then;

/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(AttendanceEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<AttendanceDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceEntity].
extension AttendanceEntityPatterns on AttendanceEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceEntity value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  List<AttendanceDataEntity>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  List<AttendanceDataEntity>? data)  $default,) {final _that = this;
switch (_that) {
case _AttendanceEntity():
return $default(_that.status,_that.message,_that.data);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  List<AttendanceDataEntity>? data)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceEntity extends AttendanceEntity {
  const _AttendanceEntity({this.status, this.message,  List<AttendanceDataEntity>? data}): _data = data,super._();
  factory _AttendanceEntity.fromJson(Map<String, dynamic> json) => _$AttendanceEntityFromJson(json);

@override final  int? status;
@override final  String? message;
 final  List<AttendanceDataEntity>? _data;
@override List<AttendanceDataEntity>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceEntityCopyWith<_AttendanceEntity> get copyWith => __$AttendanceEntityCopyWithImpl<_AttendanceEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'AttendanceEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$AttendanceEntityCopyWith<$Res> implements $AttendanceEntityCopyWith<$Res> {
  factory _$AttendanceEntityCopyWith(_AttendanceEntity value, $Res Function(_AttendanceEntity) _then) = __$AttendanceEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, List<AttendanceDataEntity>? data
});




}
/// @nodoc
class __$AttendanceEntityCopyWithImpl<$Res>
    implements _$AttendanceEntityCopyWith<$Res> {
  __$AttendanceEntityCopyWithImpl(this._self, this._then);

  final _AttendanceEntity _self;
  final $Res Function(_AttendanceEntity) _then;

/// Create a copy of AttendanceEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_AttendanceEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<AttendanceDataEntity>?,
  ));
}


}


/// @nodoc
mixin _$AttendanceDataEntity {

 int? get id; String? get date;@JsonKey(name: 'employee_id') int? get employeeId;@JsonKey(name: 'attendance_time') String? get attendanceTime;@JsonKey(name: 'departure_time') String? get departureTime; double? get lat; double? get lng;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of AttendanceDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AttendanceDataEntityCopyWith<AttendanceDataEntity> get copyWith => _$AttendanceDataEntityCopyWithImpl<AttendanceDataEntity>(this as AttendanceDataEntity, _$identity);

  /// Serializes this AttendanceDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as AttendanceDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AttendanceDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.date, _this.date) || other.date == _this.date)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.attendanceTime, _this.attendanceTime) || other.attendanceTime == _this.attendanceTime)&&(identical(other.departureTime, _this.departureTime) || other.departureTime == _this.departureTime)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as AttendanceDataEntity;
  return Object.hash(runtimeType,_this.id,_this.date,_this.employeeId,_this.attendanceTime,_this.departureTime,_this.lat,_this.lng,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as AttendanceDataEntity;
  return 'AttendanceDataEntity(id: ${_this.id}, date: ${_this.date}, employeeId: ${_this.employeeId}, attendanceTime: ${_this.attendanceTime}, departureTime: ${_this.departureTime}, lat: ${_this.lat}, lng: ${_this.lng}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $AttendanceDataEntityCopyWith<$Res>  {
  factory $AttendanceDataEntityCopyWith(AttendanceDataEntity value, $Res Function(AttendanceDataEntity) _then) = _$AttendanceDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? date,@JsonKey(name: 'employee_id') int? employeeId,@JsonKey(name: 'attendance_time') String? attendanceTime,@JsonKey(name: 'departure_time') String? departureTime, double? lat, double? lng,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$AttendanceDataEntityCopyWithImpl<$Res>
    implements $AttendanceDataEntityCopyWith<$Res> {
  _$AttendanceDataEntityCopyWithImpl(this._self, this._then);

  final AttendanceDataEntity _self;
  final $Res Function(AttendanceDataEntity) _then;

/// Create a copy of AttendanceDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? date = freezed,Object? employeeId = freezed,Object? attendanceTime = freezed,Object? departureTime = freezed,Object? lat = freezed,Object? lng = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(AttendanceDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int?,attendanceTime: freezed == attendanceTime ? _self.attendanceTime : attendanceTime // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AttendanceDataEntity].
extension AttendanceDataEntityPatterns on AttendanceDataEntity {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AttendanceDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AttendanceDataEntity() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AttendanceDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _AttendanceDataEntity():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AttendanceDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _AttendanceDataEntity() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? date, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'attendance_time')  String? attendanceTime, @JsonKey(name: 'departure_time')  String? departureTime,  double? lat,  double? lng, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AttendanceDataEntity() when $default != null:
return $default(_that.id,_that.date,_that.employeeId,_that.attendanceTime,_that.departureTime,_that.lat,_that.lng,_that.createdAt,_that.updatedAt);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? date, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'attendance_time')  String? attendanceTime, @JsonKey(name: 'departure_time')  String? departureTime,  double? lat,  double? lng, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _AttendanceDataEntity():
return $default(_that.id,_that.date,_that.employeeId,_that.attendanceTime,_that.departureTime,_that.lat,_that.lng,_that.createdAt,_that.updatedAt);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? date, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'attendance_time')  String? attendanceTime, @JsonKey(name: 'departure_time')  String? departureTime,  double? lat,  double? lng, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _AttendanceDataEntity() when $default != null:
return $default(_that.id,_that.date,_that.employeeId,_that.attendanceTime,_that.departureTime,_that.lat,_that.lng,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AttendanceDataEntity extends AttendanceDataEntity {
  const _AttendanceDataEntity({this.id, this.date, @JsonKey(name: 'employee_id') this.employeeId, @JsonKey(name: 'attendance_time') this.attendanceTime, @JsonKey(name: 'departure_time') this.departureTime, this.lat, this.lng, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _AttendanceDataEntity.fromJson(Map<String, dynamic> json) => _$AttendanceDataEntityFromJson(json);

@override final  int? id;
@override final  String? date;
@override@JsonKey(name: 'employee_id') final  int? employeeId;
@override@JsonKey(name: 'attendance_time') final  String? attendanceTime;
@override@JsonKey(name: 'departure_time') final  String? departureTime;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of AttendanceDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AttendanceDataEntityCopyWith<_AttendanceDataEntity> get copyWith => __$AttendanceDataEntityCopyWithImpl<_AttendanceDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AttendanceDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _AttendanceDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.date, date) || other.date == date)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.attendanceTime, attendanceTime) || other.attendanceTime == attendanceTime)&&(identical(other.departureTime, departureTime) || other.departureTime == departureTime)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,date,employeeId,attendanceTime,departureTime,lat,lng,createdAt,updatedAt);
}

@override
String toString() {
    return 'AttendanceDataEntity(id: $id, date: $date, employeeId: $employeeId, attendanceTime: $attendanceTime, departureTime: $departureTime, lat: $lat, lng: $lng, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$AttendanceDataEntityCopyWith<$Res> implements $AttendanceDataEntityCopyWith<$Res> {
  factory _$AttendanceDataEntityCopyWith(_AttendanceDataEntity value, $Res Function(_AttendanceDataEntity) _then) = __$AttendanceDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? date,@JsonKey(name: 'employee_id') int? employeeId,@JsonKey(name: 'attendance_time') String? attendanceTime,@JsonKey(name: 'departure_time') String? departureTime, double? lat, double? lng,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$AttendanceDataEntityCopyWithImpl<$Res>
    implements _$AttendanceDataEntityCopyWith<$Res> {
  __$AttendanceDataEntityCopyWithImpl(this._self, this._then);

  final _AttendanceDataEntity _self;
  final $Res Function(_AttendanceDataEntity) _then;

/// Create a copy of AttendanceDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? date = freezed,Object? employeeId = freezed,Object? attendanceTime = freezed,Object? departureTime = freezed,Object? lat = freezed,Object? lng = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_AttendanceDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int?,attendanceTime: freezed == attendanceTime ? _self.attendanceTime : attendanceTime // ignore: cast_nullable_to_non_nullable
as String?,departureTime: freezed == departureTime ? _self.departureTime : departureTime // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
