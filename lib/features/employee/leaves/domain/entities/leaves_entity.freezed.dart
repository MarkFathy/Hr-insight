// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'leaves_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LeavesEntity {

 int? get status; String? get message;@JsonKey(fromJson: _leavesDataFromJson) List<LeavesDataEntity>? get data;
/// Create a copy of LeavesEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeavesEntityCopyWith<LeavesEntity> get copyWith => _$LeavesEntityCopyWithImpl<LeavesEntity>(this as LeavesEntity, _$identity);

  /// Serializes this LeavesEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeavesEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeavesEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as LeavesEntity;
  return 'LeavesEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $LeavesEntityCopyWith<$Res>  {
  factory $LeavesEntityCopyWith(LeavesEntity value, $Res Function(LeavesEntity) _then) = _$LeavesEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message,@JsonKey(fromJson: _leavesDataFromJson) List<LeavesDataEntity>? data
});




}
/// @nodoc
class _$LeavesEntityCopyWithImpl<$Res>
    implements $LeavesEntityCopyWith<$Res> {
  _$LeavesEntityCopyWithImpl(this._self, this._then);

  final LeavesEntity _self;
  final $Res Function(LeavesEntity) _then;

/// Create a copy of LeavesEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(LeavesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<LeavesDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeavesEntity].
extension LeavesEntityPatterns on LeavesEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeavesEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeavesEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeavesEntity value)  $default,){
final _that = this;
switch (_that) {
case _LeavesEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeavesEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LeavesEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message, @JsonKey(fromJson: _leavesDataFromJson)  List<LeavesDataEntity>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeavesEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message, @JsonKey(fromJson: _leavesDataFromJson)  List<LeavesDataEntity>? data)  $default,) {final _that = this;
switch (_that) {
case _LeavesEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message, @JsonKey(fromJson: _leavesDataFromJson)  List<LeavesDataEntity>? data)?  $default,) {final _that = this;
switch (_that) {
case _LeavesEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeavesEntity extends LeavesEntity {
  const _LeavesEntity({this.status, this.message, @JsonKey(fromJson: _leavesDataFromJson)  List<LeavesDataEntity>? data}): _data = data,super._();
  factory _LeavesEntity.fromJson(Map<String, dynamic> json) => _$LeavesEntityFromJson(json);

@override final  int? status;
@override final  String? message;
 final  List<LeavesDataEntity>? _data;
@override@JsonKey(fromJson: _leavesDataFromJson) List<LeavesDataEntity>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LeavesEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeavesEntityCopyWith<_LeavesEntity> get copyWith => __$LeavesEntityCopyWithImpl<_LeavesEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeavesEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeavesEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'LeavesEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$LeavesEntityCopyWith<$Res> implements $LeavesEntityCopyWith<$Res> {
  factory _$LeavesEntityCopyWith(_LeavesEntity value, $Res Function(_LeavesEntity) _then) = __$LeavesEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message,@JsonKey(fromJson: _leavesDataFromJson) List<LeavesDataEntity>? data
});




}
/// @nodoc
class __$LeavesEntityCopyWithImpl<$Res>
    implements _$LeavesEntityCopyWith<$Res> {
  __$LeavesEntityCopyWithImpl(this._self, this._then);

  final _LeavesEntity _self;
  final $Res Function(_LeavesEntity) _then;

/// Create a copy of LeavesEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_LeavesEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<LeavesDataEntity>?,
  ));
}


}


/// @nodoc
mixin _$LeavesDataEntity {

 int? get id;@JsonKey(name: 'employee_id') int? get employeeId;@JsonKey(name: 'manager_id') int? get managerId;@JsonKey(name: 'day_date') DateTime? get dayDate; DateTime? get from; DateTime? get to;@JsonKey(name: 'leave_type') String? get leaveType; String? get status; String? get notes;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'updated_at') DateTime? get updatedAt;
/// Create a copy of LeavesDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LeavesDataEntityCopyWith<LeavesDataEntity> get copyWith => _$LeavesDataEntityCopyWithImpl<LeavesDataEntity>(this as LeavesDataEntity, _$identity);

  /// Serializes this LeavesDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as LeavesDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LeavesDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.employeeId, _this.employeeId) || other.employeeId == _this.employeeId)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.dayDate, _this.dayDate) || other.dayDate == _this.dayDate)&&(identical(other.from, _this.from) || other.from == _this.from)&&(identical(other.to, _this.to) || other.to == _this.to)&&(identical(other.leaveType, _this.leaveType) || other.leaveType == _this.leaveType)&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.notes, _this.notes) || other.notes == _this.notes)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as LeavesDataEntity;
  return Object.hash(runtimeType,_this.id,_this.employeeId,_this.managerId,_this.dayDate,_this.from,_this.to,_this.leaveType,_this.status,_this.notes,_this.createdAt,_this.updatedAt);
}

@override
String toString() {
  final _this = this as LeavesDataEntity;
  return 'LeavesDataEntity(id: ${_this.id}, employeeId: ${_this.employeeId}, managerId: ${_this.managerId}, dayDate: ${_this.dayDate}, from: ${_this.from}, to: ${_this.to}, leaveType: ${_this.leaveType}, status: ${_this.status}, notes: ${_this.notes}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt})';
}


}

/// @nodoc
abstract mixin class $LeavesDataEntityCopyWith<$Res>  {
  factory $LeavesDataEntityCopyWith(LeavesDataEntity value, $Res Function(LeavesDataEntity) _then) = _$LeavesDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id,@JsonKey(name: 'employee_id') int? employeeId,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'day_date') DateTime? dayDate, DateTime? from, DateTime? to,@JsonKey(name: 'leave_type') String? leaveType, String? status, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class _$LeavesDataEntityCopyWithImpl<$Res>
    implements $LeavesDataEntityCopyWith<$Res> {
  _$LeavesDataEntityCopyWithImpl(this._self, this._then);

  final LeavesDataEntity _self;
  final $Res Function(LeavesDataEntity) _then;

/// Create a copy of LeavesDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? employeeId = freezed,Object? managerId = freezed,Object? dayDate = freezed,Object? from = freezed,Object? to = freezed,Object? leaveType = freezed,Object? status = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(LeavesDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,dayDate: freezed == dayDate ? _self.dayDate : dayDate // ignore: cast_nullable_to_non_nullable
as DateTime?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,leaveType: freezed == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [LeavesDataEntity].
extension LeavesDataEntityPatterns on LeavesDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LeavesDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LeavesDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LeavesDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _LeavesDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LeavesDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _LeavesDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'day_date')  DateTime? dayDate,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType,  String? status,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LeavesDataEntity() when $default != null:
return $default(_that.id,_that.employeeId,_that.managerId,_that.dayDate,_that.from,_that.to,_that.leaveType,_that.status,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'day_date')  DateTime? dayDate,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType,  String? status,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)  $default,) {final _that = this;
switch (_that) {
case _LeavesDataEntity():
return $default(_that.id,_that.employeeId,_that.managerId,_that.dayDate,_that.from,_that.to,_that.leaveType,_that.status,_that.notes,_that.createdAt,_that.updatedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id, @JsonKey(name: 'employee_id')  int? employeeId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'day_date')  DateTime? dayDate,  DateTime? from,  DateTime? to, @JsonKey(name: 'leave_type')  String? leaveType,  String? status,  String? notes, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'updated_at')  DateTime? updatedAt)?  $default,) {final _that = this;
switch (_that) {
case _LeavesDataEntity() when $default != null:
return $default(_that.id,_that.employeeId,_that.managerId,_that.dayDate,_that.from,_that.to,_that.leaveType,_that.status,_that.notes,_that.createdAt,_that.updatedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LeavesDataEntity extends LeavesDataEntity {
  const _LeavesDataEntity({this.id, @JsonKey(name: 'employee_id') this.employeeId, @JsonKey(name: 'manager_id') this.managerId, @JsonKey(name: 'day_date') this.dayDate, this.from, this.to, @JsonKey(name: 'leave_type') this.leaveType, this.status, this.notes, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt}): super._();
  factory _LeavesDataEntity.fromJson(Map<String, dynamic> json) => _$LeavesDataEntityFromJson(json);

@override final  int? id;
@override@JsonKey(name: 'employee_id') final  int? employeeId;
@override@JsonKey(name: 'manager_id') final  int? managerId;
@override@JsonKey(name: 'day_date') final  DateTime? dayDate;
@override final  DateTime? from;
@override final  DateTime? to;
@override@JsonKey(name: 'leave_type') final  String? leaveType;
@override final  String? status;
@override final  String? notes;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'updated_at') final  DateTime? updatedAt;

/// Create a copy of LeavesDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LeavesDataEntityCopyWith<_LeavesDataEntity> get copyWith => __$LeavesDataEntityCopyWithImpl<_LeavesDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LeavesDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _LeavesDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.employeeId, employeeId) || other.employeeId == employeeId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.dayDate, dayDate) || other.dayDate == dayDate)&&(identical(other.from, from) || other.from == from)&&(identical(other.to, to) || other.to == to)&&(identical(other.leaveType, leaveType) || other.leaveType == leaveType)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,employeeId,managerId,dayDate,from,to,leaveType,status,notes,createdAt,updatedAt);
}

@override
String toString() {
    return 'LeavesDataEntity(id: $id, employeeId: $employeeId, managerId: $managerId, dayDate: $dayDate, from: $from, to: $to, leaveType: $leaveType, status: $status, notes: $notes, createdAt: $createdAt, updatedAt: $updatedAt)';
}


}

/// @nodoc
abstract mixin class _$LeavesDataEntityCopyWith<$Res> implements $LeavesDataEntityCopyWith<$Res> {
  factory _$LeavesDataEntityCopyWith(_LeavesDataEntity value, $Res Function(_LeavesDataEntity) _then) = __$LeavesDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id,@JsonKey(name: 'employee_id') int? employeeId,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'day_date') DateTime? dayDate, DateTime? from, DateTime? to,@JsonKey(name: 'leave_type') String? leaveType, String? status, String? notes,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'updated_at') DateTime? updatedAt
});




}
/// @nodoc
class __$LeavesDataEntityCopyWithImpl<$Res>
    implements _$LeavesDataEntityCopyWith<$Res> {
  __$LeavesDataEntityCopyWithImpl(this._self, this._then);

  final _LeavesDataEntity _self;
  final $Res Function(_LeavesDataEntity) _then;

/// Create a copy of LeavesDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? employeeId = freezed,Object? managerId = freezed,Object? dayDate = freezed,Object? from = freezed,Object? to = freezed,Object? leaveType = freezed,Object? status = freezed,Object? notes = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,}) {
  return _then(_LeavesDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,employeeId: freezed == employeeId ? _self.employeeId : employeeId // ignore: cast_nullable_to_non_nullable
as int?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,dayDate: freezed == dayDate ? _self.dayDate : dayDate // ignore: cast_nullable_to_non_nullable
as DateTime?,from: freezed == from ? _self.from : from // ignore: cast_nullable_to_non_nullable
as DateTime?,to: freezed == to ? _self.to : to // ignore: cast_nullable_to_non_nullable
as DateTime?,leaveType: freezed == leaveType ? _self.leaveType : leaveType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
