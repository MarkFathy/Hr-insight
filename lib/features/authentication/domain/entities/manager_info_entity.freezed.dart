// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'manager_info_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ManagerInfoEntity {

 int? get status; String? get message; ManageInfoDataEntity? get data;
/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManagerInfoEntityCopyWith<ManagerInfoEntity> get copyWith => _$ManagerInfoEntityCopyWithImpl<ManagerInfoEntity>(this as ManagerInfoEntity, _$identity);

  /// Serializes this ManagerInfoEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManagerInfoEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManagerInfoEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&(identical(other.data, _this.data) || other.data == _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManagerInfoEntity;
  return Object.hash(runtimeType,_this.status,_this.message,_this.data);
}

@override
String toString() {
  final _this = this as ManagerInfoEntity;
  return 'ManagerInfoEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $ManagerInfoEntityCopyWith<$Res>  {
  factory $ManagerInfoEntityCopyWith(ManagerInfoEntity value, $Res Function(ManagerInfoEntity) _then) = _$ManagerInfoEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, ManageInfoDataEntity? data
});


$ManageInfoDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class _$ManagerInfoEntityCopyWithImpl<$Res>
    implements $ManagerInfoEntityCopyWith<$Res> {
  _$ManagerInfoEntityCopyWithImpl(this._self, this._then);

  final ManagerInfoEntity _self;
  final $Res Function(ManagerInfoEntity) _then;

/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(ManagerInfoEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ManageInfoDataEntity?,
  ));
}
/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageInfoDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ManageInfoDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManagerInfoEntity].
extension ManagerInfoEntityPatterns on ManagerInfoEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManagerInfoEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManagerInfoEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManagerInfoEntity value)  $default,){
final _that = this;
switch (_that) {
case _ManagerInfoEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManagerInfoEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ManagerInfoEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  ManageInfoDataEntity? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManagerInfoEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  ManageInfoDataEntity? data)  $default,) {final _that = this;
switch (_that) {
case _ManagerInfoEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  ManageInfoDataEntity? data)?  $default,) {final _that = this;
switch (_that) {
case _ManagerInfoEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManagerInfoEntity extends ManagerInfoEntity {
  const _ManagerInfoEntity({this.status, this.message, this.data}): super._();
  factory _ManagerInfoEntity.fromJson(Map<String, dynamic> json) => _$ManagerInfoEntityFromJson(json);

@override final  int? status;
@override final  String? message;
@override final  ManageInfoDataEntity? data;

/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManagerInfoEntityCopyWith<_ManagerInfoEntity> get copyWith => __$ManagerInfoEntityCopyWithImpl<_ManagerInfoEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManagerInfoEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManagerInfoEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.data, data) || other.data == data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,data);
}

@override
String toString() {
    return 'ManagerInfoEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$ManagerInfoEntityCopyWith<$Res> implements $ManagerInfoEntityCopyWith<$Res> {
  factory _$ManagerInfoEntityCopyWith(_ManagerInfoEntity value, $Res Function(_ManagerInfoEntity) _then) = __$ManagerInfoEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, ManageInfoDataEntity? data
});


@override $ManageInfoDataEntityCopyWith<$Res>? get data;

}
/// @nodoc
class __$ManagerInfoEntityCopyWithImpl<$Res>
    implements _$ManagerInfoEntityCopyWith<$Res> {
  __$ManagerInfoEntityCopyWithImpl(this._self, this._then);

  final _ManagerInfoEntity _self;
  final $Res Function(_ManagerInfoEntity) _then;

/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_ManagerInfoEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ManageInfoDataEntity?,
  ));
}

/// Create a copy of ManagerInfoEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManageInfoDataEntityCopyWith<$Res>? get data {
    if (_self.data == null) {
    return null;
  }

  return $ManageInfoDataEntityCopyWith<$Res>(_self.data!, (value) {
    return _then(_self.copyWith(data: value));
  });
}
}


/// @nodoc
mixin _$ManageInfoDataEntity {

 ManagerDataEntity get manager; List<DepartmentDataEntity> get departments; List<OfficeDataEntity> get offices;
/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ManageInfoDataEntityCopyWith<ManageInfoDataEntity> get copyWith => _$ManageInfoDataEntityCopyWithImpl<ManageInfoDataEntity>(this as ManageInfoDataEntity, _$identity);

  /// Serializes this ManageInfoDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as ManageInfoDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ManageInfoDataEntity&&(identical(other.manager, _this.manager) || other.manager == _this.manager)&&const DeepCollectionEquality().equals(other.departments, _this.departments)&&const DeepCollectionEquality().equals(other.offices, _this.offices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as ManageInfoDataEntity;
  return Object.hash(runtimeType,_this.manager,const DeepCollectionEquality().hash(_this.departments),const DeepCollectionEquality().hash(_this.offices));
}

@override
String toString() {
  final _this = this as ManageInfoDataEntity;
  return 'ManageInfoDataEntity(manager: ${_this.manager}, departments: ${_this.departments}, offices: ${_this.offices})';
}


}

/// @nodoc
abstract mixin class $ManageInfoDataEntityCopyWith<$Res>  {
  factory $ManageInfoDataEntityCopyWith(ManageInfoDataEntity value, $Res Function(ManageInfoDataEntity) _then) = _$ManageInfoDataEntityCopyWithImpl;
@useResult
$Res call({
 ManagerDataEntity manager, List<DepartmentDataEntity> departments, List<OfficeDataEntity> offices
});


$ManagerDataEntityCopyWith<$Res> get manager;

}
/// @nodoc
class _$ManageInfoDataEntityCopyWithImpl<$Res>
    implements $ManageInfoDataEntityCopyWith<$Res> {
  _$ManageInfoDataEntityCopyWithImpl(this._self, this._then);

  final ManageInfoDataEntity _self;
  final $Res Function(ManageInfoDataEntity) _then;

/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? manager = null,Object? departments = null,Object? offices = null,}) {
  return _then(ManageInfoDataEntity(
manager: null == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity,departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentDataEntity>,offices: null == offices ? _self.offices : offices // ignore: cast_nullable_to_non_nullable
as List<OfficeDataEntity>,
  ));
}
/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerDataEntityCopyWith<$Res> get manager {
  
  return $ManagerDataEntityCopyWith<$Res>(_self.manager, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}


/// Adds pattern-matching-related methods to [ManageInfoDataEntity].
extension ManageInfoDataEntityPatterns on ManageInfoDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ManageInfoDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ManageInfoDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ManageInfoDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _ManageInfoDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ManageInfoDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _ManageInfoDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( ManagerDataEntity manager,  List<DepartmentDataEntity> departments,  List<OfficeDataEntity> offices)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ManageInfoDataEntity() when $default != null:
return $default(_that.manager,_that.departments,_that.offices);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( ManagerDataEntity manager,  List<DepartmentDataEntity> departments,  List<OfficeDataEntity> offices)  $default,) {final _that = this;
switch (_that) {
case _ManageInfoDataEntity():
return $default(_that.manager,_that.departments,_that.offices);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( ManagerDataEntity manager,  List<DepartmentDataEntity> departments,  List<OfficeDataEntity> offices)?  $default,) {final _that = this;
switch (_that) {
case _ManageInfoDataEntity() when $default != null:
return $default(_that.manager,_that.departments,_that.offices);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ManageInfoDataEntity extends ManageInfoDataEntity {
  const _ManageInfoDataEntity({required this.manager,  List<DepartmentDataEntity> departments = const [],  List<OfficeDataEntity> offices = const []}): _departments = departments,_offices = offices,super._();
  factory _ManageInfoDataEntity.fromJson(Map<String, dynamic> json) => _$ManageInfoDataEntityFromJson(json);

@override final  ManagerDataEntity manager;
 final  List<DepartmentDataEntity> _departments;
@override@JsonKey() List<DepartmentDataEntity> get departments {
  if (_departments is EqualUnmodifiableListView) return _departments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_departments);
}

 final  List<OfficeDataEntity> _offices;
@override@JsonKey() List<OfficeDataEntity> get offices {
  if (_offices is EqualUnmodifiableListView) return _offices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_offices);
}


/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ManageInfoDataEntityCopyWith<_ManageInfoDataEntity> get copyWith => __$ManageInfoDataEntityCopyWithImpl<_ManageInfoDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ManageInfoDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _ManageInfoDataEntity&&(identical(other.manager, manager) || other.manager == manager)&&const DeepCollectionEquality().equals(other.departments, _departments)&&const DeepCollectionEquality().equals(other.offices, _offices));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,manager,const DeepCollectionEquality().hash(_departments),const DeepCollectionEquality().hash(_offices));
}

@override
String toString() {
    return 'ManageInfoDataEntity(manager: $manager, departments: $departments, offices: $offices)';
}


}

/// @nodoc
abstract mixin class _$ManageInfoDataEntityCopyWith<$Res> implements $ManageInfoDataEntityCopyWith<$Res> {
  factory _$ManageInfoDataEntityCopyWith(_ManageInfoDataEntity value, $Res Function(_ManageInfoDataEntity) _then) = __$ManageInfoDataEntityCopyWithImpl;
@override @useResult
$Res call({
 ManagerDataEntity manager, List<DepartmentDataEntity> departments, List<OfficeDataEntity> offices
});


@override $ManagerDataEntityCopyWith<$Res> get manager;

}
/// @nodoc
class __$ManageInfoDataEntityCopyWithImpl<$Res>
    implements _$ManageInfoDataEntityCopyWith<$Res> {
  __$ManageInfoDataEntityCopyWithImpl(this._self, this._then);

  final _ManageInfoDataEntity _self;
  final $Res Function(_ManageInfoDataEntity) _then;

/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? manager = null,Object? departments = null,Object? offices = null,}) {
  return _then(_ManageInfoDataEntity(
manager: null == manager ? _self.manager : manager // ignore: cast_nullable_to_non_nullable
as ManagerDataEntity,departments: null == departments ? _self._departments : departments // ignore: cast_nullable_to_non_nullable
as List<DepartmentDataEntity>,offices: null == offices ? _self._offices : offices // ignore: cast_nullable_to_non_nullable
as List<OfficeDataEntity>,
  ));
}

/// Create a copy of ManageInfoDataEntity
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ManagerDataEntityCopyWith<$Res> get manager {
  
  return $ManagerDataEntityCopyWith<$Res>(_self.manager, (value) {
    return _then(_self.copyWith(manager: value));
  });
}
}

// dart format on
