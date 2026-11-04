// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'office_details.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OfficeDetailsEntity {

 int? get status; String? get message; OfficeDetailsDataEntity? get data;
/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeDetailsEntityCopyWith<OfficeDetailsEntity> get copyWith => _$OfficeDetailsEntityCopyWithImpl<OfficeDetailsEntity>(this as OfficeDetailsEntity, _$identity);

  /// Serializes this OfficeDetailsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfficeDetailsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeDetailsEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfficeDetailsEntity;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as OfficeDetailsEntity;
  return 'OfficeDetailsEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $OfficeDetailsEntityCopyWith<$Res>  {
  factory $OfficeDetailsEntityCopyWith(OfficeDetailsEntity value, $Res Function(OfficeDetailsEntity) _then) = _$OfficeDetailsEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, OfficeDetailsDataEntity? data
});


$OfficeDetailsDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$OfficeDetailsEntityCopyWithImpl<$Res>
    implements $OfficeDetailsEntityCopyWith<$Res> {
  _$OfficeDetailsEntityCopyWithImpl(this._self, this._then);

  final OfficeDetailsEntity _self;
  final $Res Function(OfficeDetailsEntity) _then;

/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(OfficeDetailsEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OfficeDetailsDataEntity?,
  ));
}
/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeDetailsDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OfficeDetailsDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [OfficeDetailsEntity].
extension OfficeDetailsEntityPatterns on OfficeDetailsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficeDetailsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficeDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficeDetailsEntity value)  $default,){
final _that = this;
switch (_that) {
case _OfficeDetailsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficeDetailsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OfficeDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  OfficeDetailsDataEntity? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficeDetailsEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  OfficeDetailsDataEntity? data)  $default,) {final _that = this;
switch (_that) {
case _OfficeDetailsEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  OfficeDetailsDataEntity? data)?  $default,) {final _that = this;
switch (_that) {
case _OfficeDetailsEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficeDetailsEntity extends OfficeDetailsEntity {
  const _OfficeDetailsEntity({this.status, this.message, this.data}): super._();
  factory _OfficeDetailsEntity.fromJson(Map<String, dynamic> json) => _$OfficeDetailsEntityFromJson(json);

@override final  int? status;
@override final  String? message;
@override final  OfficeDetailsDataEntity? data;

/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficeDetailsEntityCopyWith<_OfficeDetailsEntity> get copyWith => __$OfficeDetailsEntityCopyWithImpl<_OfficeDetailsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficeDetailsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficeDetailsEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'OfficeDetailsEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$OfficeDetailsEntityCopyWith<$Res> implements $OfficeDetailsEntityCopyWith<$Res> {
  factory _$OfficeDetailsEntityCopyWith(_OfficeDetailsEntity value, $Res Function(_OfficeDetailsEntity) _then) = __$OfficeDetailsEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, OfficeDetailsDataEntity? data
});


@override $OfficeDetailsDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$OfficeDetailsEntityCopyWithImpl<$Res>
    implements _$OfficeDetailsEntityCopyWith<$Res> {
  __$OfficeDetailsEntityCopyWithImpl(this._self, this._then);

  final _OfficeDetailsEntity _self;
  final $Res Function(_OfficeDetailsEntity) _then;

/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_OfficeDetailsEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as OfficeDetailsDataEntity?,
  ));
}

/// Create a copy of OfficeDetailsEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeDetailsDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $OfficeDetailsDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$OfficeDetailsDataEntity {

 int? get id; String? get name; double? get lat; double? get lng;@JsonKey(fromJson: _radiusFromJson) double? get radius;@JsonKey(name: 'manager_id') int? get managerId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt; List<EmployeeDataEntity>? get employees;
/// Create a copy of OfficeDetailsDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OfficeDetailsDataEntityCopyWith<OfficeDetailsDataEntity> get copyWith => _$OfficeDetailsDataEntityCopyWithImpl<OfficeDetailsDataEntity>(this as OfficeDetailsDataEntity, _$identity);

  /// Serializes this OfficeDetailsDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as OfficeDetailsDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OfficeDetailsDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.lat, _this.lat) || other.lat == _this.lat)&&(identical(other.lng, _this.lng) || other.lng == _this.lng)&&(identical(other.radius, _this.radius) || other.radius == _this.radius)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&const DeepCollectionEquality().equals(other.employees, _this.employees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as OfficeDetailsDataEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.lat,_this.lng,_this.radius,_this.managerId,_this.createdAt,_this.updatedAt,const DeepCollectionEquality().hash(_this.employees));
}

@override
String toString() {
  final _this = this as OfficeDetailsDataEntity;
  return 'OfficeDetailsDataEntity(id: ${_this.id}, name: ${_this.name}, lat: ${_this.lat}, lng: ${_this.lng}, radius: ${_this.radius}, managerId: ${_this.managerId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, employees: ${_this.employees})';
}


}

/// @nodoc
abstract mixin class $OfficeDetailsDataEntityCopyWith<$Res>  {
  factory $OfficeDetailsDataEntityCopyWith(OfficeDetailsDataEntity value, $Res Function(OfficeDetailsDataEntity) _then) = _$OfficeDetailsDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, double? lat, double? lng,@JsonKey(fromJson: _radiusFromJson) double? radius,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, List<EmployeeDataEntity>? employees
});




}
/// @nodoc
class _$OfficeDetailsDataEntityCopyWithImpl<$Res>
    implements $OfficeDetailsDataEntityCopyWith<$Res> {
  _$OfficeDetailsDataEntityCopyWithImpl(this._self, this._then);

  final OfficeDetailsDataEntity _self;
  final $Res Function(OfficeDetailsDataEntity) _then;

/// Create a copy of OfficeDetailsDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employees = freezed,}) {
  return _then(OfficeDetailsDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employees: freezed == employees ? _self.employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [OfficeDetailsDataEntity].
extension OfficeDetailsDataEntityPatterns on OfficeDetailsDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OfficeDetailsDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OfficeDetailsDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OfficeDetailsDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<EmployeeDataEntity>? employees)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employees);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<EmployeeDataEntity>? employees)  $default,) {final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity():
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employees);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  double? lat,  double? lng, @JsonKey(fromJson: _radiusFromJson)  double? radius, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt,  List<EmployeeDataEntity>? employees)?  $default,) {final _that = this;
switch (_that) {
case _OfficeDetailsDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.lat,_that.lng,_that.radius,_that.managerId,_that.createdAt,_that.updatedAt,_that.employees);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OfficeDetailsDataEntity extends OfficeDetailsDataEntity {
  const _OfficeDetailsDataEntity({this.id, this.name, this.lat, this.lng, @JsonKey(fromJson: _radiusFromJson) this.radius, @JsonKey(name: 'manager_id') this.managerId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt,  List<EmployeeDataEntity>? employees}): _employees = employees,super._();
  factory _OfficeDetailsDataEntity.fromJson(Map<String, dynamic> json) => _$OfficeDetailsDataEntityFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  double? lat;
@override final  double? lng;
@override@JsonKey(fromJson: _radiusFromJson) final  double? radius;
@override@JsonKey(name: 'manager_id') final  int? managerId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
 final  List<EmployeeDataEntity>? _employees;
@override List<EmployeeDataEntity>? get employees {
  final value = _employees;
  if (value == null) return null;
  if (_employees is EqualUnmodifiableListView) return _employees;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of OfficeDetailsDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OfficeDetailsDataEntityCopyWith<_OfficeDetailsDataEntity> get copyWith => __$OfficeDetailsDataEntityCopyWithImpl<_OfficeDetailsDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OfficeDetailsDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _OfficeDetailsDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.lat, lat) || other.lat == lat)&&(identical(other.lng, lng) || other.lng == lng)&&(identical(other.radius, radius) || other.radius == radius)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&const DeepCollectionEquality().equals(other.employees, _employees));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,lat,lng,radius,managerId,createdAt,updatedAt,const DeepCollectionEquality().hash(_employees));
}

@override
String toString() {
    return 'OfficeDetailsDataEntity(id: $id, name: $name, lat: $lat, lng: $lng, radius: $radius, managerId: $managerId, createdAt: $createdAt, updatedAt: $updatedAt, employees: $employees)';
}


}

/// @nodoc
abstract mixin class _$OfficeDetailsDataEntityCopyWith<$Res> implements $OfficeDetailsDataEntityCopyWith<$Res> {
  factory _$OfficeDetailsDataEntityCopyWith(_OfficeDetailsDataEntity value, $Res Function(_OfficeDetailsDataEntity) _then) = __$OfficeDetailsDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, double? lat, double? lng,@JsonKey(fromJson: _radiusFromJson) double? radius,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt, List<EmployeeDataEntity>? employees
});




}
/// @nodoc
class __$OfficeDetailsDataEntityCopyWithImpl<$Res>
    implements _$OfficeDetailsDataEntityCopyWith<$Res> {
  __$OfficeDetailsDataEntityCopyWithImpl(this._self, this._then);

  final _OfficeDetailsDataEntity _self;
  final $Res Function(_OfficeDetailsDataEntity) _then;

/// Create a copy of OfficeDetailsDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? lat = freezed,Object? lng = freezed,Object? radius = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employees = freezed,}) {
  return _then(_OfficeDetailsDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,lat: freezed == lat ? _self.lat : lat // ignore: cast_nullable_to_non_nullable
as double?,lng: freezed == lng ? _self.lng : lng // ignore: cast_nullable_to_non_nullable
as double?,radius: freezed == radius ? _self.radius : radius // ignore: cast_nullable_to_non_nullable
as double?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employees: freezed == employees ? _self._employees : employees // ignore: cast_nullable_to_non_nullable
as List<EmployeeDataEntity>?,
  ));
}


}

// dart format on
