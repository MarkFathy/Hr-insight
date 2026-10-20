import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/data/models/manager_profile_model.dart';

part 'state.freezed.dart';

@freezed
sealed class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = ProfileInitialState;
  const factory ProfileState.loading() = ProfileLoadingState;
  const factory ProfileState.loaded({
    EmployeeProfileModel? employeeProfile,
    ManagerProfileModel? managerProfile,
  }) = ProfileLoadedState;
  const factory ProfileState.managerLeaveSent() = ManagerLeaveSentState;
  const factory ProfileState.error({required String message}) =
      ProfileErrorState;
}
