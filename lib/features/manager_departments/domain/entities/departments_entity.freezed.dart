// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'departments_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DepartmentsEntity {

 int? get status; String? get message; List<DepartmentDataEntity>? get data;
/// Create a copy of DepartmentsEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentsEntityCopyWith<DepartmentsEntity> get copyWith => _$DepartmentsEntityCopyWithImpl<DepartmentsEntity>(this as DepartmentsEntity, _$identity);

  /// Serializes this DepartmentsEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DepartmentsEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsEntity&&(identical(other.status, _this.status) || other.status == _this.status)&&(identical(other.message, _this.message) || other.message == _this.message)&&const DeepCollectionEquality().equals(other.data, _this.data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DepartmentsEntity;
  return Object.hash(runtimeType,_this.status,_this.message,const DeepCollectionEquality().hash(_this.data));
}

@override
String toString() {
  final _this = this as DepartmentsEntity;
  return 'DepartmentsEntity(status: ${_this.status}, message: ${_this.message}, data: ${_this.data})';
}


}

/// @nodoc
abstract mixin class $DepartmentsEntityCopyWith<$Res>  {
  factory $DepartmentsEntityCopyWith(DepartmentsEntity value, $Res Function(DepartmentsEntity) _then) = _$DepartmentsEntityCopyWithImpl;
@useResult
$Res call({
 int? status, String? message, List<DepartmentDataEntity>? data
});




}
/// @nodoc
class _$DepartmentsEntityCopyWithImpl<$Res>
    implements $DepartmentsEntityCopyWith<$Res> {
  _$DepartmentsEntityCopyWithImpl(this._self, this._then);

  final DepartmentsEntity _self;
  final $Res Function(DepartmentsEntity) _then;

/// Create a copy of DepartmentsEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(DepartmentsEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<DepartmentDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentsEntity].
extension DepartmentsEntityPatterns on DepartmentsEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentsEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentsEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentsEntity value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentsEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentsEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentsEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? status,  String? message,  List<DepartmentDataEntity>? data)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentsEntity() when $default != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? status,  String? message,  List<DepartmentDataEntity>? data)  $default,) {final _that = this;
switch (_that) {
case _DepartmentsEntity():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? status,  String? message,  List<DepartmentDataEntity>? data)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentsEntity() when $default != null:
return $default(_that.status,_that.message,_that.data);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentsEntity extends DepartmentsEntity {
  const _DepartmentsEntity({this.status, this.message,  List<DepartmentDataEntity>? data}): _data = data,super._();
  factory _DepartmentsEntity.fromJson(Map<String, dynamic> json) => _$DepartmentsEntityFromJson(json);

@override final  int? status;
@override final  String? message;
 final  List<DepartmentDataEntity>? _data;
@override List<DepartmentDataEntity>? get data {
  final value = _data;
  if (value == null) return null;
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DepartmentsEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentsEntityCopyWith<_DepartmentsEntity> get copyWith => __$DepartmentsEntityCopyWithImpl<_DepartmentsEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentsEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentsEntity&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&const DeepCollectionEquality().equals(other.data, _data));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,status,message,const DeepCollectionEquality().hash(_data));
}

@override
String toString() {
    return 'DepartmentsEntity(status: $status, message: $message, data: $data)';
}


}

/// @nodoc
abstract mixin class _$DepartmentsEntityCopyWith<$Res> implements $DepartmentsEntityCopyWith<$Res> {
  factory _$DepartmentsEntityCopyWith(_DepartmentsEntity value, $Res Function(_DepartmentsEntity) _then) = __$DepartmentsEntityCopyWithImpl;
@override @useResult
$Res call({
 int? status, String? message, List<DepartmentDataEntity>? data
});




}
/// @nodoc
class __$DepartmentsEntityCopyWithImpl<$Res>
    implements _$DepartmentsEntityCopyWith<$Res> {
  __$DepartmentsEntityCopyWithImpl(this._self, this._then);

  final _DepartmentsEntity _self;
  final $Res Function(_DepartmentsEntity) _then;

/// Create a copy of DepartmentsEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? message = freezed,Object? data = freezed,}) {
  return _then(_DepartmentsEntity(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as int?,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,data: freezed == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<DepartmentDataEntity>?,
  ));
}


}


/// @nodoc
mixin _$DepartmentDataEntity {

 int? get id; String? get name;@JsonKey(name: 'manager_id') int? get managerId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'jobs_count') int? get jobsCount;@JsonKey(name: 'number_of_employees') int? get numberOfEmployees; List<JobDataEntity>? get jobs;
/// Create a copy of DepartmentDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentDataEntityCopyWith<DepartmentDataEntity> get copyWith => _$DepartmentDataEntityCopyWithImpl<DepartmentDataEntity>(this as DepartmentDataEntity, _$identity);

  /// Serializes this DepartmentDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as DepartmentDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.name, _this.name) || other.name == _this.name)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.jobsCount, _this.jobsCount) || other.jobsCount == _this.jobsCount)&&(identical(other.numberOfEmployees, _this.numberOfEmployees) || other.numberOfEmployees == _this.numberOfEmployees)&&const DeepCollectionEquality().equals(other.jobs, _this.jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as DepartmentDataEntity;
  return Object.hash(runtimeType,_this.id,_this.name,_this.managerId,_this.createdAt,_this.updatedAt,_this.jobsCount,_this.numberOfEmployees,const DeepCollectionEquality().hash(_this.jobs));
}

@override
String toString() {
  final _this = this as DepartmentDataEntity;
  return 'DepartmentDataEntity(id: ${_this.id}, name: ${_this.name}, managerId: ${_this.managerId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, jobsCount: ${_this.jobsCount}, numberOfEmployees: ${_this.numberOfEmployees}, jobs: ${_this.jobs})';
}


}

/// @nodoc
abstract mixin class $DepartmentDataEntityCopyWith<$Res>  {
  factory $DepartmentDataEntityCopyWith(DepartmentDataEntity value, $Res Function(DepartmentDataEntity) _then) = _$DepartmentDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? name,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'jobs_count') int? jobsCount,@JsonKey(name: 'number_of_employees') int? numberOfEmployees, List<JobDataEntity>? jobs
});




}
/// @nodoc
class _$DepartmentDataEntityCopyWithImpl<$Res>
    implements $DepartmentDataEntityCopyWith<$Res> {
  _$DepartmentDataEntityCopyWithImpl(this._self, this._then);

  final DepartmentDataEntity _self;
  final $Res Function(DepartmentDataEntity) _then;

/// Create a copy of DepartmentDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? jobsCount = freezed,Object? numberOfEmployees = freezed,Object? jobs = freezed,}) {
  return _then(DepartmentDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,jobsCount: freezed == jobsCount ? _self.jobsCount : jobsCount // ignore: cast_nullable_to_non_nullable
as int?,numberOfEmployees: freezed == numberOfEmployees ? _self.numberOfEmployees : numberOfEmployees // ignore: cast_nullable_to_non_nullable
as int?,jobs: freezed == jobs ? _self.jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobDataEntity>?,
  ));
}

}


/// Adds pattern-matching-related methods to [DepartmentDataEntity].
extension DepartmentDataEntityPatterns on DepartmentDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DepartmentDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DepartmentDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DepartmentDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _DepartmentDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DepartmentDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _DepartmentDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? name, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'jobs_count')  int? jobsCount, @JsonKey(name: 'number_of_employees')  int? numberOfEmployees,  List<JobDataEntity>? jobs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DepartmentDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.managerId,_that.createdAt,_that.updatedAt,_that.jobsCount,_that.numberOfEmployees,_that.jobs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? name, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'jobs_count')  int? jobsCount, @JsonKey(name: 'number_of_employees')  int? numberOfEmployees,  List<JobDataEntity>? jobs)  $default,) {final _that = this;
switch (_that) {
case _DepartmentDataEntity():
return $default(_that.id,_that.name,_that.managerId,_that.createdAt,_that.updatedAt,_that.jobsCount,_that.numberOfEmployees,_that.jobs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? name, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'jobs_count')  int? jobsCount, @JsonKey(name: 'number_of_employees')  int? numberOfEmployees,  List<JobDataEntity>? jobs)?  $default,) {final _that = this;
switch (_that) {
case _DepartmentDataEntity() when $default != null:
return $default(_that.id,_that.name,_that.managerId,_that.createdAt,_that.updatedAt,_that.jobsCount,_that.numberOfEmployees,_that.jobs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DepartmentDataEntity extends DepartmentDataEntity {
  const _DepartmentDataEntity({this.id, this.name, @JsonKey(name: 'manager_id') this.managerId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'jobs_count') this.jobsCount, @JsonKey(name: 'number_of_employees') this.numberOfEmployees,  List<JobDataEntity>? jobs}): _jobs = jobs,super._();
  factory _DepartmentDataEntity.fromJson(Map<String, dynamic> json) => _$DepartmentDataEntityFromJson(json);

@override final  int? id;
@override final  String? name;
@override@JsonKey(name: 'manager_id') final  int? managerId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'jobs_count') final  int? jobsCount;
@override@JsonKey(name: 'number_of_employees') final  int? numberOfEmployees;
 final  List<JobDataEntity>? _jobs;
@override List<JobDataEntity>? get jobs {
  final value = _jobs;
  if (value == null) return null;
  if (_jobs is EqualUnmodifiableListView) return _jobs;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of DepartmentDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentDataEntityCopyWith<_DepartmentDataEntity> get copyWith => __$DepartmentDataEntityCopyWithImpl<_DepartmentDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _DepartmentDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.jobsCount, jobsCount) || other.jobsCount == jobsCount)&&(identical(other.numberOfEmployees, numberOfEmployees) || other.numberOfEmployees == numberOfEmployees)&&const DeepCollectionEquality().equals(other.jobs, _jobs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,name,managerId,createdAt,updatedAt,jobsCount,numberOfEmployees,const DeepCollectionEquality().hash(_jobs));
}

@override
String toString() {
    return 'DepartmentDataEntity(id: $id, name: $name, managerId: $managerId, createdAt: $createdAt, updatedAt: $updatedAt, jobsCount: $jobsCount, numberOfEmployees: $numberOfEmployees, jobs: $jobs)';
}


}

/// @nodoc
abstract mixin class _$DepartmentDataEntityCopyWith<$Res> implements $DepartmentDataEntityCopyWith<$Res> {
  factory _$DepartmentDataEntityCopyWith(_DepartmentDataEntity value, $Res Function(_DepartmentDataEntity) _then) = __$DepartmentDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? name,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'jobs_count') int? jobsCount,@JsonKey(name: 'number_of_employees') int? numberOfEmployees, List<JobDataEntity>? jobs
});




}
/// @nodoc
class __$DepartmentDataEntityCopyWithImpl<$Res>
    implements _$DepartmentDataEntityCopyWith<$Res> {
  __$DepartmentDataEntityCopyWithImpl(this._self, this._then);

  final _DepartmentDataEntity _self;
  final $Res Function(_DepartmentDataEntity) _then;

/// Create a copy of DepartmentDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? name = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? jobsCount = freezed,Object? numberOfEmployees = freezed,Object? jobs = freezed,}) {
  return _then(_DepartmentDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,name: freezed == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,jobsCount: freezed == jobsCount ? _self.jobsCount : jobsCount // ignore: cast_nullable_to_non_nullable
as int?,numberOfEmployees: freezed == numberOfEmployees ? _self.numberOfEmployees : numberOfEmployees // ignore: cast_nullable_to_non_nullable
as int?,jobs: freezed == jobs ? _self._jobs : jobs // ignore: cast_nullable_to_non_nullable
as List<JobDataEntity>?,
  ));
}


}


/// @nodoc
mixin _$JobDataEntity {

 int? get id; String? get title;@JsonKey(name: 'department_id') int? get departmentId;@JsonKey(name: 'manager_id') int? get managerId;@JsonKey(name: 'created_at') String? get createdAt;@JsonKey(name: 'updated_at') String? get updatedAt;@JsonKey(name: 'employees_count') int? get employeesCount;
/// Create a copy of JobDataEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JobDataEntityCopyWith<JobDataEntity> get copyWith => _$JobDataEntityCopyWithImpl<JobDataEntity>(this as JobDataEntity, _$identity);

  /// Serializes this JobDataEntity to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  final _this = this as JobDataEntity;
  return identical(this, other) || (other.runtimeType == runtimeType&&other is JobDataEntity&&(identical(other.id, _this.id) || other.id == _this.id)&&(identical(other.title, _this.title) || other.title == _this.title)&&(identical(other.departmentId, _this.departmentId) || other.departmentId == _this.departmentId)&&(identical(other.managerId, _this.managerId) || other.managerId == _this.managerId)&&(identical(other.createdAt, _this.createdAt) || other.createdAt == _this.createdAt)&&(identical(other.updatedAt, _this.updatedAt) || other.updatedAt == _this.updatedAt)&&(identical(other.employeesCount, _this.employeesCount) || other.employeesCount == _this.employeesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
  final _this = this as JobDataEntity;
  return Object.hash(runtimeType,_this.id,_this.title,_this.departmentId,_this.managerId,_this.createdAt,_this.updatedAt,_this.employeesCount);
}

@override
String toString() {
  final _this = this as JobDataEntity;
  return 'JobDataEntity(id: ${_this.id}, title: ${_this.title}, departmentId: ${_this.departmentId}, managerId: ${_this.managerId}, createdAt: ${_this.createdAt}, updatedAt: ${_this.updatedAt}, employeesCount: ${_this.employeesCount})';
}


}

/// @nodoc
abstract mixin class $JobDataEntityCopyWith<$Res>  {
  factory $JobDataEntityCopyWith(JobDataEntity value, $Res Function(JobDataEntity) _then) = _$JobDataEntityCopyWithImpl;
@useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'department_id') int? departmentId,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'employees_count') int? employeesCount
});




}
/// @nodoc
class _$JobDataEntityCopyWithImpl<$Res>
    implements $JobDataEntityCopyWith<$Res> {
  _$JobDataEntityCopyWithImpl(this._self, this._then);

  final JobDataEntity _self;
  final $Res Function(JobDataEntity) _then;

/// Create a copy of JobDataEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? title = freezed,Object? departmentId = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employeesCount = freezed,}) {
  return _then(JobDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employeesCount: freezed == employeesCount ? _self.employeesCount : employeesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [JobDataEntity].
extension JobDataEntityPatterns on JobDataEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _JobDataEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _JobDataEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _JobDataEntity value)  $default,){
final _that = this;
switch (_that) {
case _JobDataEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _JobDataEntity value)?  $default,){
final _that = this;
switch (_that) {
case _JobDataEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeesCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _JobDataEntity() when $default != null:
return $default(_that.id,_that.title,_that.departmentId,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeesCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeesCount)  $default,) {final _that = this;
switch (_that) {
case _JobDataEntity():
return $default(_that.id,_that.title,_that.departmentId,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeesCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? id,  String? title, @JsonKey(name: 'department_id')  int? departmentId, @JsonKey(name: 'manager_id')  int? managerId, @JsonKey(name: 'created_at')  String? createdAt, @JsonKey(name: 'updated_at')  String? updatedAt, @JsonKey(name: 'employees_count')  int? employeesCount)?  $default,) {final _that = this;
switch (_that) {
case _JobDataEntity() when $default != null:
return $default(_that.id,_that.title,_that.departmentId,_that.managerId,_that.createdAt,_that.updatedAt,_that.employeesCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _JobDataEntity extends JobDataEntity {
  const _JobDataEntity({this.id, this.title, @JsonKey(name: 'department_id') this.departmentId, @JsonKey(name: 'manager_id') this.managerId, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'updated_at') this.updatedAt, @JsonKey(name: 'employees_count') this.employeesCount}): super._();
  factory _JobDataEntity.fromJson(Map<String, dynamic> json) => _$JobDataEntityFromJson(json);

@override final  int? id;
@override final  String? title;
@override@JsonKey(name: 'department_id') final  int? departmentId;
@override@JsonKey(name: 'manager_id') final  int? managerId;
@override@JsonKey(name: 'created_at') final  String? createdAt;
@override@JsonKey(name: 'updated_at') final  String? updatedAt;
@override@JsonKey(name: 'employees_count') final  int? employeesCount;

/// Create a copy of JobDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JobDataEntityCopyWith<_JobDataEntity> get copyWith => __$JobDataEntityCopyWithImpl<_JobDataEntity>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JobDataEntityToJson(this, );
}

@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is _JobDataEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.title, title) || other.title == title)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId)&&(identical(other.managerId, managerId) || other.managerId == managerId)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.employeesCount, employeesCount) || other.employeesCount == employeesCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode {
    return Object.hash(runtimeType,id,title,departmentId,managerId,createdAt,updatedAt,employeesCount);
}

@override
String toString() {
    return 'JobDataEntity(id: $id, title: $title, departmentId: $departmentId, managerId: $managerId, createdAt: $createdAt, updatedAt: $updatedAt, employeesCount: $employeesCount)';
}


}

/// @nodoc
abstract mixin class _$JobDataEntityCopyWith<$Res> implements $JobDataEntityCopyWith<$Res> {
  factory _$JobDataEntityCopyWith(_JobDataEntity value, $Res Function(_JobDataEntity) _then) = __$JobDataEntityCopyWithImpl;
@override @useResult
$Res call({
 int? id, String? title,@JsonKey(name: 'department_id') int? departmentId,@JsonKey(name: 'manager_id') int? managerId,@JsonKey(name: 'created_at') String? createdAt,@JsonKey(name: 'updated_at') String? updatedAt,@JsonKey(name: 'employees_count') int? employeesCount
});




}
/// @nodoc
class __$JobDataEntityCopyWithImpl<$Res>
    implements _$JobDataEntityCopyWith<$Res> {
  __$JobDataEntityCopyWithImpl(this._self, this._then);

  final _JobDataEntity _self;
  final $Res Function(_JobDataEntity) _then;

/// Create a copy of JobDataEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? title = freezed,Object? departmentId = freezed,Object? managerId = freezed,Object? createdAt = freezed,Object? updatedAt = freezed,Object? employeesCount = freezed,}) {
  return _then(_JobDataEntity(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,departmentId: freezed == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int?,managerId: freezed == managerId ? _self.managerId : managerId // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as String?,employeesCount: freezed == employeesCount ? _self.employeesCount : employeesCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
