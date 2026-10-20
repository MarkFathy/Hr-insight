// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint, type=warning, deprecated_member_use, deprecated_member_use_from_same_package
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DepartmentsAndJobsEvent {





@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DepartmentsAndJobsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsEvent()';
}


}

/// @nodoc
class $DepartmentsAndJobsEventCopyWith<$Res>  {
$DepartmentsAndJobsEventCopyWith(DepartmentsAndJobsEvent _, $Res Function(DepartmentsAndJobsEvent) __);
}


/// Adds pattern-matching-related methods to [DepartmentsAndJobsEvent].
extension DepartmentsAndJobsEventPatterns on DepartmentsAndJobsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GetDepartmentsAndJobsEvent value)?  getDepartmentsAndJobs,TResult Function( AddDepartmentEvent value)?  addDepartment,TResult Function( EditDepartmentEvent value)?  editDepartment,TResult Function( DeleteDepartmentsEvent value)?  deleteDepartments,TResult Function( AddJobEvent value)?  addJob,TResult Function( EditJobEvent value)?  editJob,TResult Function( DeleteJobEvent value)?  deleteJob,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent() when getDepartmentsAndJobs != null:
return getDepartmentsAndJobs(_that);case AddDepartmentEvent() when addDepartment != null:
return addDepartment(_that);case EditDepartmentEvent() when editDepartment != null:
return editDepartment(_that);case DeleteDepartmentsEvent() when deleteDepartments != null:
return deleteDepartments(_that);case AddJobEvent() when addJob != null:
return addJob(_that);case EditJobEvent() when editJob != null:
return editJob(_that);case DeleteJobEvent() when deleteJob != null:
return deleteJob(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GetDepartmentsAndJobsEvent value)  getDepartmentsAndJobs,required TResult Function( AddDepartmentEvent value)  addDepartment,required TResult Function( EditDepartmentEvent value)  editDepartment,required TResult Function( DeleteDepartmentsEvent value)  deleteDepartments,required TResult Function( AddJobEvent value)  addJob,required TResult Function( EditJobEvent value)  editJob,required TResult Function( DeleteJobEvent value)  deleteJob,}){
final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent():
return getDepartmentsAndJobs(_that);case AddDepartmentEvent():
return addDepartment(_that);case EditDepartmentEvent():
return editDepartment(_that);case DeleteDepartmentsEvent():
return deleteDepartments(_that);case AddJobEvent():
return addJob(_that);case EditJobEvent():
return editJob(_that);case DeleteJobEvent():
return deleteJob(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GetDepartmentsAndJobsEvent value)?  getDepartmentsAndJobs,TResult? Function( AddDepartmentEvent value)?  addDepartment,TResult? Function( EditDepartmentEvent value)?  editDepartment,TResult? Function( DeleteDepartmentsEvent value)?  deleteDepartments,TResult? Function( AddJobEvent value)?  addJob,TResult? Function( EditJobEvent value)?  editJob,TResult? Function( DeleteJobEvent value)?  deleteJob,}){
final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent() when getDepartmentsAndJobs != null:
return getDepartmentsAndJobs(_that);case AddDepartmentEvent() when addDepartment != null:
return addDepartment(_that);case EditDepartmentEvent() when editDepartment != null:
return editDepartment(_that);case DeleteDepartmentsEvent() when deleteDepartments != null:
return deleteDepartments(_that);case AddJobEvent() when addJob != null:
return addJob(_that);case EditJobEvent() when editJob != null:
return editJob(_that);case DeleteJobEvent() when deleteJob != null:
return deleteJob(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getDepartmentsAndJobs,TResult Function()?  addDepartment,TResult Function( int id)?  editDepartment,TResult Function( int id)?  deleteDepartments,TResult Function( int departmentId)?  addJob,TResult Function( int jobId,  int departmentId)?  editJob,TResult Function( int id)?  deleteJob,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent() when getDepartmentsAndJobs != null:
return getDepartmentsAndJobs();case AddDepartmentEvent() when addDepartment != null:
return addDepartment();case EditDepartmentEvent() when editDepartment != null:
return editDepartment(_that.id);case DeleteDepartmentsEvent() when deleteDepartments != null:
return deleteDepartments(_that.id);case AddJobEvent() when addJob != null:
return addJob(_that.departmentId);case EditJobEvent() when editJob != null:
return editJob(_that.jobId,_that.departmentId);case DeleteJobEvent() when deleteJob != null:
return deleteJob(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getDepartmentsAndJobs,required TResult Function()  addDepartment,required TResult Function( int id)  editDepartment,required TResult Function( int id)  deleteDepartments,required TResult Function( int departmentId)  addJob,required TResult Function( int jobId,  int departmentId)  editJob,required TResult Function( int id)  deleteJob,}) {final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent():
return getDepartmentsAndJobs();case AddDepartmentEvent():
return addDepartment();case EditDepartmentEvent():
return editDepartment(_that.id);case DeleteDepartmentsEvent():
return deleteDepartments(_that.id);case AddJobEvent():
return addJob(_that.departmentId);case EditJobEvent():
return editJob(_that.jobId,_that.departmentId);case DeleteJobEvent():
return deleteJob(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getDepartmentsAndJobs,TResult? Function()?  addDepartment,TResult? Function( int id)?  editDepartment,TResult? Function( int id)?  deleteDepartments,TResult? Function( int departmentId)?  addJob,TResult? Function( int jobId,  int departmentId)?  editJob,TResult? Function( int id)?  deleteJob,}) {final _that = this;
switch (_that) {
case GetDepartmentsAndJobsEvent() when getDepartmentsAndJobs != null:
return getDepartmentsAndJobs();case AddDepartmentEvent() when addDepartment != null:
return addDepartment();case EditDepartmentEvent() when editDepartment != null:
return editDepartment(_that.id);case DeleteDepartmentsEvent() when deleteDepartments != null:
return deleteDepartments(_that.id);case AddJobEvent() when addJob != null:
return addJob(_that.departmentId);case EditJobEvent() when editJob != null:
return editJob(_that.jobId,_that.departmentId);case DeleteJobEvent() when deleteJob != null:
return deleteJob(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class GetDepartmentsAndJobsEvent implements DepartmentsAndJobsEvent {
  const GetDepartmentsAndJobsEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is GetDepartmentsAndJobsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsEvent.getDepartmentsAndJobs()';
}


}




/// @nodoc


class AddDepartmentEvent implements DepartmentsAndJobsEvent {
  const AddDepartmentEvent();
  






@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddDepartmentEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
    return 'DepartmentsAndJobsEvent.addDepartment()';
}


}




/// @nodoc


class EditDepartmentEvent implements DepartmentsAndJobsEvent {
  const EditDepartmentEvent({required this.id});
  

 final  int id;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditDepartmentEventCopyWith<EditDepartmentEvent> get copyWith => _$EditDepartmentEventCopyWithImpl<EditDepartmentEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EditDepartmentEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'DepartmentsAndJobsEvent.editDepartment(id: $id)';
}


}

/// @nodoc
abstract mixin class $EditDepartmentEventCopyWith<$Res> implements $DepartmentsAndJobsEventCopyWith<$Res> {
  factory $EditDepartmentEventCopyWith(EditDepartmentEvent value, $Res Function(EditDepartmentEvent) _then) = _$EditDepartmentEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$EditDepartmentEventCopyWithImpl<$Res>
    implements $EditDepartmentEventCopyWith<$Res> {
  _$EditDepartmentEventCopyWithImpl(this._self, this._then);

  final EditDepartmentEvent _self;
  final $Res Function(EditDepartmentEvent) _then;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(EditDepartmentEvent(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteDepartmentsEvent implements DepartmentsAndJobsEvent {
  const DeleteDepartmentsEvent(this.id);
  

 final  int id;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteDepartmentsEventCopyWith<DeleteDepartmentsEvent> get copyWith => _$DeleteDepartmentsEventCopyWithImpl<DeleteDepartmentsEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteDepartmentsEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'DepartmentsAndJobsEvent.deleteDepartments(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteDepartmentsEventCopyWith<$Res> implements $DepartmentsAndJobsEventCopyWith<$Res> {
  factory $DeleteDepartmentsEventCopyWith(DeleteDepartmentsEvent value, $Res Function(DeleteDepartmentsEvent) _then) = _$DeleteDepartmentsEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteDepartmentsEventCopyWithImpl<$Res>
    implements $DeleteDepartmentsEventCopyWith<$Res> {
  _$DeleteDepartmentsEventCopyWithImpl(this._self, this._then);

  final DeleteDepartmentsEvent _self;
  final $Res Function(DeleteDepartmentsEvent) _then;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteDepartmentsEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class AddJobEvent implements DepartmentsAndJobsEvent {
  const AddJobEvent(this.departmentId);
  

 final  int departmentId;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AddJobEventCopyWith<AddJobEvent> get copyWith => _$AddJobEventCopyWithImpl<AddJobEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is AddJobEvent&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,departmentId);
}

@override
String toString() {
    return 'DepartmentsAndJobsEvent.addJob(departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $AddJobEventCopyWith<$Res> implements $DepartmentsAndJobsEventCopyWith<$Res> {
  factory $AddJobEventCopyWith(AddJobEvent value, $Res Function(AddJobEvent) _then) = _$AddJobEventCopyWithImpl;
@useResult
$Res call({
 int departmentId
});




}
/// @nodoc
class _$AddJobEventCopyWithImpl<$Res>
    implements $AddJobEventCopyWith<$Res> {
  _$AddJobEventCopyWithImpl(this._self, this._then);

  final AddJobEvent _self;
  final $Res Function(AddJobEvent) _then;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? departmentId = null,}) {
  return _then(AddJobEvent(
null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class EditJobEvent implements DepartmentsAndJobsEvent {
  const EditJobEvent({required this.jobId, required this.departmentId});
  

 final  int jobId;
 final  int departmentId;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EditJobEventCopyWith<EditJobEvent> get copyWith => _$EditJobEventCopyWithImpl<EditJobEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is EditJobEvent&&(identical(other.jobId, jobId) || other.jobId == jobId)&&(identical(other.departmentId, departmentId) || other.departmentId == departmentId));
}


@override
int get hashCode {
    return Object.hash(runtimeType,jobId,departmentId);
}

@override
String toString() {
    return 'DepartmentsAndJobsEvent.editJob(jobId: $jobId, departmentId: $departmentId)';
}


}

/// @nodoc
abstract mixin class $EditJobEventCopyWith<$Res> implements $DepartmentsAndJobsEventCopyWith<$Res> {
  factory $EditJobEventCopyWith(EditJobEvent value, $Res Function(EditJobEvent) _then) = _$EditJobEventCopyWithImpl;
@useResult
$Res call({
 int jobId, int departmentId
});




}
/// @nodoc
class _$EditJobEventCopyWithImpl<$Res>
    implements $EditJobEventCopyWith<$Res> {
  _$EditJobEventCopyWithImpl(this._self, this._then);

  final EditJobEvent _self;
  final $Res Function(EditJobEvent) _then;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? jobId = null,Object? departmentId = null,}) {
  return _then(EditJobEvent(
jobId: null == jobId ? _self.jobId : jobId // ignore: cast_nullable_to_non_nullable
as int,departmentId: null == departmentId ? _self.departmentId : departmentId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class DeleteJobEvent implements DepartmentsAndJobsEvent {
  const DeleteJobEvent(this.id);
  

 final  int id;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeleteJobEventCopyWith<DeleteJobEvent> get copyWith => _$DeleteJobEventCopyWithImpl<DeleteJobEvent>(this, _$identity);



@override
bool operator ==(Object other) {
    return identical(this, other) || (other.runtimeType == runtimeType&&other is DeleteJobEvent&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode {
    return Object.hash(runtimeType,id);
}

@override
String toString() {
    return 'DepartmentsAndJobsEvent.deleteJob(id: $id)';
}


}

/// @nodoc
abstract mixin class $DeleteJobEventCopyWith<$Res> implements $DepartmentsAndJobsEventCopyWith<$Res> {
  factory $DeleteJobEventCopyWith(DeleteJobEvent value, $Res Function(DeleteJobEvent) _then) = _$DeleteJobEventCopyWithImpl;
@useResult
$Res call({
 int id
});




}
/// @nodoc
class _$DeleteJobEventCopyWithImpl<$Res>
    implements $DeleteJobEventCopyWith<$Res> {
  _$DeleteJobEventCopyWithImpl(this._self, this._then);

  final DeleteJobEvent _self;
  final $Res Function(DeleteJobEvent) _then;

/// Create a copy of DepartmentsAndJobsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(DeleteJobEvent(
null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
