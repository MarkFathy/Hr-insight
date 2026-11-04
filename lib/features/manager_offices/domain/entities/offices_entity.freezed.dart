// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'offices_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfficesEntity {

 int? get status; String? get message; List<OfficeDataEntity>? get data;
/// Create a copy of OfficesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficesEntityCopyWith<OfficesEntity> get copyWith => _$OfficesEntityCopyWithImpl<OfficesEntity>(this as OfficesEntity, _$identity);

  /// Serializes this OfficesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfficesEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficesEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfficesEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as OfficesEntity;
  return 'OfficesEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $OfficesEntityCopyWith<$Res>  {
  factory $OfficesEntityCopyWith(OfficesEntity value, $Res Function(OfficesEntity) _then) = _$OfficesEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, List<OfficeDataEntity>? data
});




}
/// @nodoc
class _$OfficesEntityCopyWithImpl<$Res>
    implements $OfficesEntityCopyWith<$Res> {
  _$OfficesEntityCopyWithImpl(this._self, this._then);

  final OfficesEntity _self;
  final $Res Function(OfficesEntity) _then;

/// Create a copy of OfficesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(OfficesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<OfficeDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficesEntity].
extension OfficesEntityPatterns on OfficesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficesEntity value)  $default,){
final _that = this;
switch (_that) {
case _OfficesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OfficesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  List<OfficeDataEntity>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  List<OfficeDataEntity>? data)  $default,) {final _that = this;
switch (_that) {
case _OfficesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  List<OfficeDataEntity>? data)?  $default,) {final _that = this;
switch (_that) {
case _OfficesEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficesEntity extends OfficesEntity {
  const _OfficesEntity({this.status, this.message,  List<OfficeDataEntity>? data}): _data = data,super._();
  factory _OfficesEntity.fromJson(Map<String, dynamic> json) => _$OfficesEntityFromJson(json);

@override final  int? status;
@override final  String? message;
 final  List<OfficeDataEntity>? _data;
@override List<OfficeDataEntity>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OfficesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficesEntityCopyWith<_OfficesEntity> get copyWith => __$OfficesEntityCopyWithImpl<_OfficesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficesEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'OfficesEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OfficesEntityCopyWith<$Res> implements $OfficesEntityCopyWith<$Res> {
  factory _$OfficesEntityCopyWith(_OfficesEntity value, $Res Function(_OfficesEntity) _then) = __$OfficesEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, List<OfficeDataEntity>? data
});




}
/// @nodoc
class __$OfficesEntityCopyWithImpl<$Res>
    implements _$OfficesEntityCopyWith<$Res> {
  __$OfficesEntityCopyWithImpl(this._self, this._then);

  final _OfficesEntity _self;
  final $Res Function(_OfficesEntity) _then;

/// Create a copy of OfficesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_OfficesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<OfficeDataEntity>?,
  ));
}


}


/// @nodoc
mixin _$OfficeDataEntity {

 int? get id; String? get name; double? get lat; double? get lng;@JsonKey(fromJson: _radiusFromJson) double? get radius;@JsonKey(name: 'manager_id') int? get managerId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'employees_count') int? get employeeCount;
/// Create a copy of OfficeDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeDataEntityCopyWith<OfficeDataEntity> get copyWith => _$OfficeDataEntityCopyWithImpl<OfficeDataEntity>(this as OfficeDataEntity, _$identity);

  /// Serializes this OfficeDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfficeDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.employeeCount, _this.employeeCount) || other.employeeCount == _this.employeeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfficeDataEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.lat,_this.lng,_this.radius,_this.managerId,_this.createdAt,_this.updatedAt,_this.employeeCount);
}

@override
String toString() {
  final _this = this as OfficeDataEntity;
  return 'OfficeDataEntity(id: ${_this.id}, name: ${_this.name}, lat: ${_this.lat}, lng: ${_this.lng}, radius: ${_this.radius}, managerId: ${_this.managerId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, employeeCount: ${_this.employeeCount})';
}


}

/// @nodoc
abstract mixin class $OfficeDataEntityCopyWith<$Res>  {
  factory $OfficeDataEntityCopyWith(OfficeDataEntity value, $Res Function(OfficeDataEntity) _then) = _$OfficeDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, double? lat, double? lng,@JsonKey(fromJson: _radiusFromJson) double? radius,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'employees_count') int? employeeCount
});




}
/// @nodoc
class _$OfficeDataEntityCopyWithImpl<$Res>
    implements $OfficeDataEntityCopyWith<$Res> {
  _$OfficeDataEntityCopyWithImpl(this._self, this._then);

  final OfficeDataEntity _self;
  final $Res Function(OfficeDataEntity) _then;

/// Create a copy of OfficeDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employeeCount = freezed,}) {
  return _then(OfficeDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employeeCount: freezed == employeeCount ? _self.employeeCount : employeeCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficeDataEntity].
extension OfficeDataEntityPatterns on OfficeDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficeDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficeDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficeDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _OfficeDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficeDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OfficeDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeeCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficeDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeeCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeeCount)  $default,) {final _that = this;
switch (_that) {
case _OfficeDataEntity():
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeeCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeeCount)?  $default,) {final _that = this;
switch (_that) {
case _OfficeDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeeCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficeDataEntity extends OfficeDataEntity {
  const _OfficeDataEntity({this.id, this.name, this.lat, this.lng, @JsonKey(fromJson: _radiusFromJson) this.radius, @JsonKey(name: 'manager_id') this.managerId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'employees_count') this.employeeCount}): super._();
  factory _OfficeDataEntity.fromJson(Map<String, dynamic> json) => _$OfficeDataEntityFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(fromJson: _radiusFromJson) final  double? radius;
@override@JsonKey(name: 'manager_id') final  int? managerId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'employees_count') final  int? employeeCount;

/// Create a copy of OfficeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficeDataEntityCopyWith<_OfficeDataEntity> get copyWith => __$OfficeDataEntityCopyWithImpl<_OfficeDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficeDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficeDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employeeCount, employeeCount) || other.employeeCount == employeeCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,lat,lng,radius,managerId,createdAt,updatedAt,employeeCount);
}

@override
String toString() {
    return 'OfficeDataEntity(id: $id, name: $name, lat: $lat, lng: $lng, radius: $radius, managerId: $managerId, createdAt: $createdAt, updatedAt: $updatedAt, employeeCount: $employeeCount)';
}


}

/// @nodoc
abstract mixin class _$OfficeDataEntityCopyWith<$Res> implements $OfficeDataEntityCopyWith<$Res> {
  factory _$OfficeDataEntityCopyWith(_OfficeDataEntity value, $Res Function(_OfficeDataEntity) _then) = __$OfficeDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, double? lat, double? lng,@JsonKey(fromJson: _radiusFromJson) double? radius,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'employees_count') int? employeeCount
});




}
/// @nodoc
class __$OfficeDataEntityCopyWithImpl<$Res>
    implements _$OfficeDataEntityCopyWith<$Res> {
  __$OfficeDataEntityCopyWithImpl(this._self, this._then);

  final _OfficeDataEntity _self;
  final $Res Function(_OfficeDataEntity) _then;

/// Create a copy of OfficeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employeeCount = freezed,}) {
  return _then(_OfficeDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employeeCount: freezed == employeeCount ? _self.employeeCount : employeeCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
