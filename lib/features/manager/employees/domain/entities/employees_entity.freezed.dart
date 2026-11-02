// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employees_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeesEntity {

 int? get status; String? get message;@JsonKey(fromJson: _employeesDataFromJson) List<EmployeeDataEntity>? get data;
/// Create a copy of EmployeesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeesEntityCopyWith<EmployeesEntity> get copyWith => _$EmployeesEntityCopyWithImpl<EmployeesEntity>(this as EmployeesEntity, _$identity);

  /// Serializes this EmployeesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmployeesEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeesEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmployeesEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as EmployeesEntity;
  return 'EmployeesEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $EmployeesEntityCopyWith<$Res>  {
  factory $EmployeesEntityCopyWith(EmployeesEntity value, $Res Function(EmployeesEntity) _then) = _$EmployeesEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message,@JsonKey(fromJson: _employeesDataFromJson) List<EmployeeDataEntity>? data
});




}
/// @nodoc
class _$EmployeesEntityCopyWithImpl<$Res>
    implements $EmployeesEntityCopyWith<$Res> {
  _$EmployeesEntityCopyWithImpl(this._self, this._then);

  final EmployeesEntity _self;
  final $Res Function(EmployeesEntity) _then;

/// Create a copy of EmployeesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(EmployeesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<EmployeeDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [EmployeesEntity].
extension EmployeesEntityPatterns on EmployeesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeesEntity value)  $default,){
final _that = this;
switch (_that) {
case _EmployeesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message, @JsonKey(fromJson: _employeesDataFromJson)  List<EmployeeDataEntity>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message, @JsonKey(fromJson: _employeesDataFromJson)  List<EmployeeDataEntity>? data)  $default,) {final _that = this;
switch (_that) {
case _EmployeesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message, @JsonKey(fromJson: _employeesDataFromJson)  List<EmployeeDataEntity>? data)?  $default,) {final _that = this;
switch (_that) {
case _EmployeesEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeesEntity extends EmployeesEntity {
  const _EmployeesEntity({this.status, this.message, @JsonKey(fromJson: _employeesDataFromJson)  List<EmployeeDataEntity>? data}): _data = data,super._();
  factory _EmployeesEntity.fromJson(Map<String, dynamic> json) => _$EmployeesEntityFromJson(json);

@override final  int? status;
@override final  String? message;
 final  List<EmployeeDataEntity>? _data;
@override@JsonKey(fromJson: _employeesDataFromJson) List<EmployeeDataEntity>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of EmployeesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeesEntityCopyWith<_EmployeesEntity> get copyWith => __$EmployeesEntityCopyWithImpl<_EmployeesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeesEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'EmployeesEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$EmployeesEntityCopyWith<$Res> implements $EmployeesEntityCopyWith<$Res> {
  factory _$EmployeesEntityCopyWith(_EmployeesEntity value, $Res Function(_EmployeesEntity) _then) = __$EmployeesEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message,@JsonKey(fromJson: _employeesDataFromJson) List<EmployeeDataEntity>? data
});




}
/// @nodoc
class __$EmployeesEntityCopyWithImpl<$Res>
    implements _$EmployeesEntityCopyWith<$Res> {
  __$EmployeesEntityCopyWithImpl(this._self, this._then);

  final _EmployeesEntity _self;
  final $Res Function(_EmployeesEntity) _then;

/// Create a copy of EmployeesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_EmployeesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<EmployeeDataEntity>?,
  ));
}


}

// dart format on
