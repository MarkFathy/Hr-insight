// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerEntity {

 int? get status; String? get message; TokenDataEntity? get data;
/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerEntityCopyWith<ManagerEntity> get copyWith => _$ManagerEntityCopyWithImpl<ManagerEntity>(this as ManagerEntity, _$identity);

  /// Serializes this ManagerEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagerEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagerEntity;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as ManagerEntity;
  return 'ManagerEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $ManagerEntityCopyWith<$Res>  {
  factory $ManagerEntityCopyWith(ManagerEntity value, $Res Function(ManagerEntity) _then) = _$ManagerEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, TokenDataEntity? data
});


$TokenDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$ManagerEntityCopyWithImpl<$Res>
    implements $ManagerEntityCopyWith<$Res> {
  _$ManagerEntityCopyWithImpl(this._self, this._then);

  final ManagerEntity _self;
  final $Res Function(ManagerEntity) _then;

/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(ManagerEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenDataEntity?,
  ));
}
/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TokenDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagerEntity].
extension ManagerEntityPatterns on ManagerEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerEntity value)  $default,){
final _that = this;
switch (_that) {
case _ManagerEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  TokenDataEntity? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  TokenDataEntity? data)  $default,) {final _that = this;
switch (_that) {
case _ManagerEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  TokenDataEntity? data)?  $default,) {final _that = this;
switch (_that) {
case _ManagerEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerEntity extends ManagerEntity {
  const _ManagerEntity({this.status, this.message, this.data}): super._();
  factory _ManagerEntity.fromJson(Map<String, dynamic> json) => _$ManagerEntityFromJson(json);

@override final  int? status;
@override final  String? message;
@override final  TokenDataEntity? data;

/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerEntityCopyWith<_ManagerEntity> get copyWith => __$ManagerEntityCopyWithImpl<_ManagerEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'ManagerEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ManagerEntityCopyWith<$Res> implements $ManagerEntityCopyWith<$Res> {
  factory _$ManagerEntityCopyWith(_ManagerEntity value, $Res Function(_ManagerEntity) _then) = __$ManagerEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, TokenDataEntity? data
});


@override $TokenDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$ManagerEntityCopyWithImpl<$Res>
    implements _$ManagerEntityCopyWith<$Res> {
  __$ManagerEntityCopyWithImpl(this._self, this._then);

  final _ManagerEntity _self;
  final $Res Function(_ManagerEntity) _then;

/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ManagerEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as TokenDataEntity?,
  ));
}

/// Create a copy of ManagerEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TokenDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $TokenDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$TokenDataEntity {

 String? get token;@JsonKey(name: 'data') ManagerDataEntity? get manager;
/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TokenDataEntityCopyWith<TokenDataEntity> get copyWith => _$TokenDataEntityCopyWithImpl<TokenDataEntity>(this as TokenDataEntity, _$identity);

  /// Serializes this TokenDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as TokenDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TokenDataEntity&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.manager, _this.manager) || other.manager == _this.manager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as TokenDataEntity;
  return Object.hash(runtimeType,_this.token,_this.manager);
}

@override
String toString() {
  final _this = this as TokenDataEntity;
  return 'TokenDataEntity(token: ${_this.token}, manager: ${_this.manager})';
}


}

/// @nodoc
abstract mixin class $TokenDataEntityCopyWith<$Res>  {
  factory $TokenDataEntityCopyWith(TokenDataEntity value, $Res Function(TokenDataEntity) _then) = _$TokenDataEntityCopyWithImpl;
@useResult
$Res call({
 String? token,@JsonKey(name: 'data') ManagerDataEntity? manager
});


$ManagerDataEntityCopyWith<$Res>? get manager;

}
/// @nodoc
class _$TokenDataEntityCopyWithImpl<$Res>
    implements $TokenDataEntityCopyWith<$Res> {
  _$TokenDataEntityCopyWithImpl(this._self, this._then);

  final TokenDataEntity _self;
  final $Res Function(TokenDataEntity) _then;

/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? manager = freezed,}) {
  return _then(TokenDataEntity(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity?,
  ));
}
/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerDataEntityCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerDataEntityCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}


/// Adds pattern-matching-related methods to [TokenDataEntity].
extension TokenDataEntityPatterns on TokenDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TokenDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TokenDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TokenDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _TokenDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TokenDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _TokenDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'data')  ManagerDataEntity? manager)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TokenDataEntity() when $default != null:
return $default(_that.token,_that.manager);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'data')  ManagerDataEntity? manager)  $default,) {final _that = this;
switch (_that) {
case _TokenDataEntity():
return $default(_that.token,_that.manager);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token, @JsonKey(name: 'data')  ManagerDataEntity? manager)?  $default,) {final _that = this;
switch (_that) {
case _TokenDataEntity() when $default != null:
return $default(_that.token,_that.manager);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TokenDataEntity extends TokenDataEntity {
  const _TokenDataEntity({this.token, @JsonKey(name: 'data') this.manager}): super._();
  factory _TokenDataEntity.fromJson(Map<String, dynamic> json) => _$TokenDataEntityFromJson(json);

@override final  String? token;
@override@JsonKey(name: 'data') final  ManagerDataEntity? manager;

/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TokenDataEntityCopyWith<_TokenDataEntity> get copyWith => __$TokenDataEntityCopyWithImpl<_TokenDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TokenDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _TokenDataEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.manager, manager) || other.manager == manager));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,manager);
}

@override
String toString() {
    return 'TokenDataEntity(token: $token, manager: $manager)';
}


}

/// @nodoc
abstract mixin class _$TokenDataEntityCopyWith<$Res> implements $TokenDataEntityCopyWith<$Res> {
  factory _$TokenDataEntityCopyWith(_TokenDataEntity value, $Res Function(_TokenDataEntity) _then) = __$TokenDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String? token,@JsonKey(name: 'data') ManagerDataEntity? manager
});


@override $ManagerDataEntityCopyWith<$Res>? get manager;

}
/// @nodoc
class __$TokenDataEntityCopyWithImpl<$Res>
    implements _$TokenDataEntityCopyWith<$Res> {
  __$TokenDataEntityCopyWithImpl(this._self, this._then);

  final _TokenDataEntity _self;
  final $Res Function(_TokenDataEntity) _then;

/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? manager = freezed,}) {
  return _then(_TokenDataEntity(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity?,
  ));
}

/// Create a copy of TokenDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerDataEntityCopyWith<$Res>? get manager {
    if (_self.manager == null) {
    return null;
  }

  return $ManagerDataEntityCopyWith<$Res>(_self.manager!, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}


/// @nodoc
mixin _$ManagerDataEntity {

 int? get id; String? get name; String? get email; String? get phone; String? get image; String? get pin; String? get status; String? get company;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of ManagerDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerDataEntityCopyWith<ManagerDataEntity> get copyWith => _$ManagerDataEntityCopyWithImpl<ManagerDataEntity>(this as ManagerDataEntity, _$identity);

  /// Serializes this ManagerDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagerDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.pin, _this.pin) || other.pin == _this.pin)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.company, _this.company) || other.company == _this.company)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagerDataEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.email,_this.phone,_this.image,_this.pin,_this.status,_this.company,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as ManagerDataEntity;
  return 'ManagerDataEntity(id: ${_this.id}, name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, image: ${_this.image}, pin: ${_this.pin}, status: ${_this.status}, company: ${_this.company}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $ManagerDataEntityCopyWith<$Res>  {
  factory $ManagerDataEntityCopyWith(ManagerDataEntity value, $Res Function(ManagerDataEntity) _then) = _$ManagerDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? name, String? email, String? phone, String? image, String? pin, String? status, String? company,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$ManagerDataEntityCopyWithImpl<$Res>
    implements $ManagerDataEntityCopyWith<$Res> {
  _$ManagerDataEntityCopyWithImpl(this._self, this._then);

  final ManagerDataEntity _self;
  final $Res Function(ManagerDataEntity) _then;

/// Create a copy of ManagerDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? image = freezed,Object? pin = freezed,Object? status = freezed,Object? company = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(ManagerDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ManagerDataEntity].
extension ManagerDataEntityPatterns on ManagerDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _ManagerDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? phone,  String? image,  String? pin,  String? status,  String? company, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.image,_that.pin,_that.status,_that.company,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name,  String? email,  String? phone,  String? image,  String? pin,  String? status,  String? company, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _ManagerDataEntity():
return $default(_that.id,_that.name,_that.email,_that.phone,_that.image,_that.pin,_that.status,_that.company,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name,  String? email,  String? phone,  String? image,  String? pin,  String? status,  String? company, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _ManagerDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.email,_that.phone,_that.image,_that.pin,_that.status,_that.company,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerDataEntity extends ManagerDataEntity {
  const _ManagerDataEntity({this.id, this.name, this.email, this.phone, this.image, this.pin, this.status, this.company, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _ManagerDataEntity.fromJson(Map<String, dynamic> json) => _$ManagerDataEntityFromJson(json);

@override final  int? id;
@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String? image;
@override final  String? pin;
@override final  String? status;
@override final  String? company;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of ManagerDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerDataEntityCopyWith<_ManagerDataEntity> get copyWith => __$ManagerDataEntityCopyWithImpl<_ManagerDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.image, image) || other.image == image)&&(identical(other.pin, pin) || other.pin == pin)&&(identical(other.status, status) || other.status == status)&&(identical(other.company, company) || other.company == company)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,email,phone,image,pin,status,company,createdAt,updatedAt);
}

@override
String toString() {
    return 'ManagerDataEntity(id: $id, name: $name, email: $email, phone: $phone, image: $image, pin: $pin, status: $status, company: $company, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$ManagerDataEntityCopyWith<$Res> implements $ManagerDataEntityCopyWith<$Res> {
  factory _$ManagerDataEntityCopyWith(_ManagerDataEntity value, $Res Function(_ManagerDataEntity) _then) = __$ManagerDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name, String? email, String? phone, String? image, String? pin, String? status, String? company,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$ManagerDataEntityCopyWithImpl<$Res>
    implements _$ManagerDataEntityCopyWith<$Res> {
  __$ManagerDataEntityCopyWithImpl(this._self, this._then);

  final _ManagerDataEntity _self;
  final $Res Function(_ManagerDataEntity) _then;

/// Create a copy of ManagerDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? image = freezed,Object? pin = freezed,Object? status = freezed,Object? company = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_ManagerDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,pin: freezed == pin ? _self.pin : pin // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,company: freezed == company ? _self.company : company // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
