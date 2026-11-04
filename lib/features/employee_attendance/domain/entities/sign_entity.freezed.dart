// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignEntity {

 int? get status; String? get message; dynamic get data;
/// Create a copy of SignEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SignEntityCopyWith<SignEntity> get copyWith => _$SignEntityCopyWithImpl<SignEntity>(this as SignEntity, _$identity);

  /// Serializes this SignEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as SignEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SignEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as SignEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as SignEntity;
  return 'SignEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $SignEntityCopyWith<$Res>  {
  factory $SignEntityCopyWith(SignEntity value, $Res Function(SignEntity) _then) = _$SignEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, dynamic data
});




}
/// @nodoc
class _$SignEntityCopyWithImpl<$Res>
    implements $SignEntityCopyWith<$Res> {
  _$SignEntityCopyWithImpl(this._self, this._then);

  final SignEntity _self;
  final $Res Function(SignEntity) _then;

/// Create a copy of SignEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(SignEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SignEntity].
extension SignEntityPatterns on SignEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SignEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SignEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SignEntity value)  $default,){
final _that = this;
switch (_that) {
case _SignEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SignEntity value)?  $default,){
final _that = this;
switch (_that) {
case _SignEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  dynamic data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SignEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  dynamic data)  $default,) {final _that = this;
switch (_that) {
case _SignEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  dynamic data)?  $default,) {final _that = this;
switch (_that) {
case _SignEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SignEntity extends SignEntity {
  const _SignEntity({this.status, this.message, this.data}): super._();
  factory _SignEntity.fromJson(Map<String, dynamic> json) => _$SignEntityFromJson(json);

@override final  int? status;
@override final  String? message;
@override final  dynamic data;

/// Create a copy of SignEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SignEntityCopyWith<_SignEntity> get copyWith => __$SignEntityCopyWithImpl<_SignEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SignEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _SignEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(data));
}

@override
String toString() {
    return 'SignEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$SignEntityCopyWith<$Res> implements $SignEntityCopyWith<$Res> {
  factory _$SignEntityCopyWith(_SignEntity value, $Res Function(_SignEntity) _then) = __$SignEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, dynamic data
});




}
/// @nodoc
class __$SignEntityCopyWithImpl<$Res>
    implements _$SignEntityCopyWith<$Res> {
  __$SignEntityCopyWithImpl(this._self, this._then);

  final _SignEntity _self;
  final $Res Function(_SignEntity) _then;

/// Create a copy of SignEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_SignEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}

// dart format on
