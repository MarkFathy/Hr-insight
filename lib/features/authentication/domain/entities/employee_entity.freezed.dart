// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'employee_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$EmployeeEntity {

 int? get status; String? get message; UserDataEntity? get data;
/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeEntityCopyWith<EmployeeEntity> get copyWith => _$EmployeeEntityCopyWithImpl<EmployeeEntity>(this as EmployeeEntity, _$identity);

  /// Serializes this EmployeeEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmployeeEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmployeeEntity;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as EmployeeEntity;
  return 'EmployeeEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $EmployeeEntityCopyWith<$Res>  {
  factory $EmployeeEntityCopyWith(EmployeeEntity value, $Res Function(EmployeeEntity) _then) = _$EmployeeEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, UserDataEntity? data
});


$UserDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$EmployeeEntityCopyWithImpl<$Res>
    implements $EmployeeEntityCopyWith<$Res> {
  _$EmployeeEntityCopyWithImpl(this._self, this._then);

  final EmployeeEntity _self;
  final $Res Function(EmployeeEntity) _then;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(EmployeeEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserDataEntity?,
  ));
}
/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmployeeEntity].
extension EmployeeEntityPatterns on EmployeeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeEntity value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  UserDataEntity? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  UserDataEntity? data)  $default,) {final _that = this;
switch (_that) {
case _EmployeeEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  UserDataEntity? data)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeEntity extends EmployeeEntity {
  const _EmployeeEntity({this.status, this.message, this.data}): super._();
  factory _EmployeeEntity.fromJson(Map<String, dynamic> json) => _$EmployeeEntityFromJson(json);

@override final  int? status;
@override final  String? message;
@override final  UserDataEntity? data;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeEntityCopyWith<_EmployeeEntity> get copyWith => __$EmployeeEntityCopyWithImpl<_EmployeeEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'EmployeeEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$EmployeeEntityCopyWith<$Res> implements $EmployeeEntityCopyWith<$Res> {
  factory _$EmployeeEntityCopyWith(_EmployeeEntity value, $Res Function(_EmployeeEntity) _then) = __$EmployeeEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, UserDataEntity? data
});


@override $UserDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$EmployeeEntityCopyWithImpl<$Res>
    implements _$EmployeeEntityCopyWith<$Res> {
  __$EmployeeEntityCopyWithImpl(this._self, this._then);

  final _EmployeeEntity _self;
  final $Res Function(_EmployeeEntity) _then;

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_EmployeeEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as UserDataEntity?,
  ));
}

/// Create a copy of EmployeeEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $UserDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$UserDataEntity {

 String? get token;@JsonKey(name: 'data') EmployeeDataEntity? get employee;
/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserDataEntityCopyWith<UserDataEntity> get copyWith => _$UserDataEntityCopyWithImpl<UserDataEntity>(this as UserDataEntity, _$identity);

  /// Serializes this UserDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as UserDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserDataEntity&&(identical(other.token, _this.token) || other.token == _this.token)&&(identical(other.employee, _this.employee) || other.employee == _this.employee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as UserDataEntity;
  return Object.hash(runtimeType,_this.token,_this.employee);
}

@override
String toString() {
  final _this = this as UserDataEntity;
  return 'UserDataEntity(token: ${_this.token}, employee: ${_this.employee})';
}


}

/// @nodoc
abstract mixin class $UserDataEntityCopyWith<$Res>  {
  factory $UserDataEntityCopyWith(UserDataEntity value, $Res Function(UserDataEntity) _then) = _$UserDataEntityCopyWithImpl;
@useResult
$Res call({
 String? token,@JsonKey(name: 'data') EmployeeDataEntity? employee
});


$EmployeeDataEntityCopyWith<$Res>? get employee;

}
/// @nodoc
class _$UserDataEntityCopyWithImpl<$Res>
    implements $UserDataEntityCopyWith<$Res> {
  _$UserDataEntityCopyWithImpl(this._self, this._then);

  final UserDataEntity _self;
  final $Res Function(UserDataEntity) _then;

/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = freezed,Object? employee = freezed,}) {
  return _then(UserDataEntity(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeDataEntity?,
  ));
}
/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeDataEntityCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeDataEntityCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserDataEntity].
extension UserDataEntityPatterns on UserDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _UserDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _UserDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'data')  EmployeeDataEntity? employee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserDataEntity() when $default != null:
return $default(_that.token,_that.employee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? token, @JsonKey(name: 'data')  EmployeeDataEntity? employee)  $default,) {final _that = this;
switch (_that) {
case _UserDataEntity():
return $default(_that.token,_that.employee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? token, @JsonKey(name: 'data')  EmployeeDataEntity? employee)?  $default,) {final _that = this;
switch (_that) {
case _UserDataEntity() when $default != null:
return $default(_that.token,_that.employee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserDataEntity extends UserDataEntity {
  const _UserDataEntity({this.token, @JsonKey(name: 'data') this.employee}): super._();
  factory _UserDataEntity.fromJson(Map<String, dynamic> json) => _$UserDataEntityFromJson(json);

@override final  String? token;
@override@JsonKey(name: 'data') final  EmployeeDataEntity? employee;

/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserDataEntityCopyWith<_UserDataEntity> get copyWith => __$UserDataEntityCopyWithImpl<_UserDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserDataEntity&&(identical(other.token, token) || other.token == token)&&(identical(other.employee, employee) || other.employee == employee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,token,employee);
}

@override
String toString() {
    return 'UserDataEntity(token: $token, employee: $employee)';
}


}

/// @nodoc
abstract mixin class _$UserDataEntityCopyWith<$Res> implements $UserDataEntityCopyWith<$Res> {
  factory _$UserDataEntityCopyWith(_UserDataEntity value, $Res Function(_UserDataEntity) _then) = __$UserDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String? token,@JsonKey(name: 'data') EmployeeDataEntity? employee
});


@override $EmployeeDataEntityCopyWith<$Res>? get employee;

}
/// @nodoc
class __$UserDataEntityCopyWithImpl<$Res>
    implements _$UserDataEntityCopyWith<$Res> {
  __$UserDataEntityCopyWithImpl(this._self, this._then);

  final _UserDataEntity _self;
  final $Res Function(_UserDataEntity) _then;

/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = freezed,Object? employee = freezed,}) {
  return _then(_UserDataEntity(
token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,employee: freezed == employee ? _self.employee : employee // ignore: cast_nullable_to_non_nullable
as EmployeeDataEntity?,
  ));
}

/// Create a copy of UserDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EmployeeDataEntityCopyWith<$Res>? get employee {
    if (_self.employee == null) {
    return null;
  }

  return $EmployeeDataEntityCopyWith<$Res>(_self.employee!, (value) {
    return _then(_self.copyWith(employee: value));
  });
}
}


/// @nodoc
mixin _$EmployeeDataEntity {

 String? get name; String? get email; String? get phone; String? get address; String? get image;@JsonKey(name: 'UID') String? get uID;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'created_at') String? get createdAt; int? get id; ManagerDataEntity? get manager; JobEntity? get job; DepartmentDataEntity? get department; OfficeDataEntity? get office;
/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EmployeeDataEntityCopyWith<EmployeeDataEntity> get copyWith => _$EmployeeDataEntityCopyWithImpl<EmployeeDataEntity>(this as EmployeeDataEntity, _$identity);

  /// Serializes this EmployeeDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as EmployeeDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmployeeDataEntity&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.email, _this.email) || other.email == _this.email)&&(identical(other.phone, _this.phone) || other.phone == _this.phone)&&(identical(other.address, _this.address) || other.address == _this.address)&&(identical(other.image, _this.image) || other.image == _this.image)&&(identical(other.uID, _this.uID) || other.uID == _this.uID)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.manager, _this.manager) || other.manager == _this.manager)&&(identical(other.job, _this.job) || other.job == _this.job)&&(identical(other.department, _this.department) || other.department == _this.department)&&(identical(other.office, _this.office) || other.office == _this.office));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as EmployeeDataEntity;
  return Object.hash(runtimeType,_this.name,_this.email,_this.phone,_this.address,_this.image,_this.uID,_this.updatedAt,_this.createdAt,_this.id,_this.manager,_this.job,_this.department,_this.office);
}

@override
String toString() {
  final _this = this as EmployeeDataEntity;
  return 'EmployeeDataEntity(name: ${_this.name}, email: ${_this.email}, phone: ${_this.phone}, address: ${_this.address}, image: ${_this.image}, uID: ${_this.uID}, updatedAt: ${_this.updatedAt}, createdAt: ${_this.createdAt}, id: ${_this.id}, manager: ${_this.manager}, job: ${_this.job}, department: ${_this.department}, office: ${_this.office})';
}


}

/// @nodoc
abstract mixin class $EmployeeDataEntityCopyWith<$Res>  {
  factory $EmployeeDataEntityCopyWith(EmployeeDataEntity value, $Res Function(EmployeeDataEntity) _then) = _$EmployeeDataEntityCopyWithImpl;
@useResult
$Res call({
 String? name, String? email, String? phone, String? address, String? image,@JsonKey(name: 'UID') String? uID,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'created_at') String? createdAt, int? id, ManagerDataEntity? manager, JobEntity? job, DepartmentDataEntity? department, OfficeDataEntity? office
});


$ManagerDataEntityCopyWith<$Res>? get manager;$JobEntityCopyWith<$Res>? get job;$DepartmentDataEntityCopyWith<$Res>? get department;$OfficeDataEntityCopyWith<$Res>? get office;

}
/// @nodoc
class _$EmployeeDataEntityCopyWithImpl<$Res>
    implements $EmployeeDataEntityCopyWith<$Res> {
  _$EmployeeDataEntityCopyWithImpl(this._self, this._then);

  final EmployeeDataEntity _self;
  final $Res Function(EmployeeDataEntity) _then;

/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? image = freezed,Object? uID = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,Object? id = freezed,Object? manager = freezed,Object? job = freezed,Object? department = freezed,Object? office = freezed,}) {
  return _then(EmployeeDataEntity(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,uID: freezed == uID ? _self.uID : uID // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as DepartmentDataEntity?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as OfficeDataEntity?,
  ));
}
/// Create a copy of EmployeeDataEntity
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
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentDataEntityCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $DepartmentDataEntityCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeDataEntityCopyWith<$Res>? get office {
    if (_self.office == null) {
    return null;
  }

  return $OfficeDataEntityCopyWith<$Res>(_self.office!, (value) {
    return _then(_self.copyWith(office: value));
  });
}
}


/// Adds pattern-matching-related methods to [EmployeeDataEntity].
extension EmployeeDataEntityPatterns on EmployeeDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EmployeeDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EmployeeDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EmployeeDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _EmployeeDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EmployeeDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _EmployeeDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? address,  String? image, @JsonKey(name: 'UID')  String? uID, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_at')  String? createdAt,  int? id,  ManagerDataEntity? manager,  JobEntity? job,  DepartmentDataEntity? department,  OfficeDataEntity? office)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EmployeeDataEntity() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.address,_that.image,_that.uID,_that.updatedAt,_that.createdAt,_that.id,_that.manager,_that.job,_that.department,_that.office);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? name,  String? email,  String? phone,  String? address,  String? image, @JsonKey(name: 'UID')  String? uID, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_at')  String? createdAt,  int? id,  ManagerDataEntity? manager,  JobEntity? job,  DepartmentDataEntity? department,  OfficeDataEntity? office)  $default,) {final _that = this;
switch (_that) {
case _EmployeeDataEntity():
return $default(_that.name,_that.email,_that.phone,_that.address,_that.image,_that.uID,_that.updatedAt,_that.createdAt,_that.id,_that.manager,_that.job,_that.department,_that.office);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? name,  String? email,  String? phone,  String? address,  String? image, @JsonKey(name: 'UID')  String? uID, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'created_at')  String? createdAt,  int? id,  ManagerDataEntity? manager,  JobEntity? job,  DepartmentDataEntity? department,  OfficeDataEntity? office)?  $default,) {final _that = this;
switch (_that) {
case _EmployeeDataEntity() when $default != null:
return $default(_that.name,_that.email,_that.phone,_that.address,_that.image,_that.uID,_that.updatedAt,_that.createdAt,_that.id,_that.manager,_that.job,_that.department,_that.office);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EmployeeDataEntity extends EmployeeDataEntity {
  const _EmployeeDataEntity({this.name, this.email, this.phone, this.address, this.image, @JsonKey(name: 'UID') this.uID, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'created_at') this.createdAt, this.id, this.manager, this.job, this.department, this.office}): super._();
  factory _EmployeeDataEntity.fromJson(Map<String, dynamic> json) => _$EmployeeDataEntityFromJson(json);

@override final  String? name;
@override final  String? email;
@override final  String? phone;
@override final  String? address;
@override final  String? image;
@override@JsonKey(name: 'UID') final  String? uID;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override final  int? id;
@override final  ManagerDataEntity? manager;
@override final  JobEntity? job;
@override final  DepartmentDataEntity? department;
@override final  OfficeDataEntity? office;

/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EmployeeDataEntityCopyWith<_EmployeeDataEntity> get copyWith => __$EmployeeDataEntityCopyWithImpl<_EmployeeDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EmployeeDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _EmployeeDataEntity&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.address, address) || other.address == address)&&(identical(other.image, image) || other.image == image)&&(identical(other.uID, uID) || other.uID == uID)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.id, id) || other.id == id)&&(identical(other.manager, manager) || other.manager == manager)&&(identical(other.job, job) || other.job == job)&&(identical(other.department, department) || other.department == department)&&(identical(other.office, office) || other.office == office));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,name,email,phone,address,image,uID,updatedAt,createdAt,id,manager,job,department,office);
}

@override
String toString() {
    return 'EmployeeDataEntity(name: $name, email: $email, phone: $phone, address: $address, image: $image, uID: $uID, updatedAt: $updatedAt, createdAt: $createdAt, id: $id, manager: $manager, job: $job, department: $department, office: $office)';
}


}

/// @nodoc
abstract mixin class _$EmployeeDataEntityCopyWith<$Res> implements $EmployeeDataEntityCopyWith<$Res> {
  factory _$EmployeeDataEntityCopyWith(_EmployeeDataEntity value, $Res Function(_EmployeeDataEntity) _then) = __$EmployeeDataEntityCopyWithImpl;
@override @useResult
$Res call({
 String? name, String? email, String? phone, String? address, String? image,@JsonKey(name: 'UID') String? uID,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'created_at') String? createdAt, int? id, ManagerDataEntity? manager, JobEntity? job, DepartmentDataEntity? department, OfficeDataEntity? office
});


@override $ManagerDataEntityCopyWith<$Res>? get manager;@override $JobEntityCopyWith<$Res>? get job;@override $DepartmentDataEntityCopyWith<$Res>? get department;@override $OfficeDataEntityCopyWith<$Res>? get office;

}
/// @nodoc
class __$EmployeeDataEntityCopyWithImpl<$Res>
    implements _$EmployeeDataEntityCopyWith<$Res> {
  __$EmployeeDataEntityCopyWithImpl(this._self, this._then);

  final _EmployeeDataEntity _self;
  final $Res Function(_EmployeeDataEntity) _then;

/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = freezed,Object? email = freezed,Object? phone = freezed,Object? address = freezed,Object? image = freezed,Object? uID = freezed,Object? updatedAt = freezed,Object? createdAt = freezed,Object? id = freezed,Object? manager = freezed,Object? job = freezed,Object? department = freezed,Object? office = freezed,}) {
  return _then(_EmployeeDataEntity(
name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,image: freezed == image ? _self.image : image // ignore: cast_nullable_to_non_nullable
as String?,uID: freezed == uID ? _self.uID : uID // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,manager: freezed == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity?,job: freezed == job ? _self.job : job // ignore: cast_nullable_to_non_nullable
as JobEntity?,department: freezed == department ? _self.department : department // ignore: cast_nullable_to_non_nullable
as DepartmentDataEntity?,office: freezed == office ? _self.office : office // ignore: cast_nullable_to_non_nullable
as OfficeDataEntity?,
  ));
}

/// Create a copy of EmployeeDataEntity
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
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$JobEntityCopyWith<$Res>? get job {
    if (_self.job == null) {
    return null;
  }

  return $JobEntityCopyWith<$Res>(_self.job!, (value) {
    return _then(_self.copyWith(job: value));
  });
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DepartmentDataEntityCopyWith<$Res>? get department {
    if (_self.department == null) {
    return null;
  }

  return $DepartmentDataEntityCopyWith<$Res>(_self.department!, (value) {
    return _then(_self.copyWith(department: value));
  });
}/// Create a copy of EmployeeDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$OfficeDataEntityCopyWith<$Res>? get office {
    if (_self.office == null) {
    return null;
  }

  return $OfficeDataEntityCopyWith<$Res>(_self.office!, (value) {
    return _then(_self.copyWith(office: value));
  });
}
}


/// @nodoc
mixin _$JobEntity {

 int? get id; String? get title;@JsonKey(name: 'department_id') int? get departmentId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;
/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobEntityCopyWith<JobEntity> get copyWith => _$JobEntityCopyWithImpl<JobEntity>(this as JobEntity, _$identity);

  /// Serializes this JobEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JobEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JobEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.departmentId,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as JobEntity;
  return 'JobEntity(id: ${_this.id}, title: ${_this.title}, departmentId: ${_this.departmentId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $JobEntityCopyWith<$Res>  {
  factory $JobEntityCopyWith(JobEntity value, $Res Function(JobEntity) _then) = _$JobEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'department_id') int? departmentId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class _$JobEntityCopyWithImpl<$Res>
    implements $JobEntityCopyWith<$Res> {
  _$JobEntityCopyWithImpl(this._self, this._then);

  final JobEntity _self;
  final $Res Function(JobEntity) _then;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? departmentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(JobEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobEntity].
extension JobEntityPatterns on JobEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
return $default(_that.id,_that.title,_that.departmentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _JobEntity():
return $default(_that.id,_that.title,_that.departmentId,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _JobEntity() when $default != null:
return $default(_that.id,_that.title,_that.departmentId,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobEntity extends JobEntity {
  const _JobEntity({this.id, this.title, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _JobEntity.fromJson(Map<String, dynamic> json) => _$JobEntityFromJson(json);

@override final  int? id;
@override final  String? title;
@override@JsonKey(name: 'department_id') final  int? departmentId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobEntityCopyWith<_JobEntity> get copyWith => __$JobEntityCopyWithImpl<_JobEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,departmentId,createdAt,updatedAt);
}

@override
String toString() {
    return 'JobEntity(id: $id, title: $title, departmentId: $departmentId, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$JobEntityCopyWith<$Res> implements $JobEntityCopyWith<$Res> {
  factory _$JobEntityCopyWith(_JobEntity value, $Res Function(_JobEntity) _then) = __$JobEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'department_id') int? departmentId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt
});




}
/// @nodoc
class __$JobEntityCopyWithImpl<$Res>
    implements _$JobEntityCopyWith<$Res> {
  __$JobEntityCopyWithImpl(this._self, this._then);

  final _JobEntity _self;
  final $Res Function(_JobEntity) _then;

/// Create a copy of JobEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? departmentId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_JobEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
