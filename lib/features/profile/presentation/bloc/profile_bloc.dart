import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_app/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/features/profile/data/models/manager_profile_model.dart';
import 'package:hr_app/features/profile/domain/usecases/get_profile.dart';
import 'package:hr_app/features/profile/domain/usecases/update_profile.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_event.dart';
import 'package:hr_app/features/profile/presentation/bloc/profile_state.dart';

export 'profile_event.dart';
export 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfile getProfile;
  final UpdateProfile updateProfile;

  ProfileBloc({
    GetProfile? getProfile,
    GetProfile? getProfileUC,
    UpdateProfile? updateProfile,
    UpdateProfile? updateProfileUC,
  }) : getProfile = getProfile ?? getProfileUC!,
       updateProfile = updateProfile ?? updateProfileUC!,
       super(const ProfileState.initial()) {
    on<GetProfileEvent>(_getProfile);
    on<UpdateProfileEvent>(_updateProfile);
  }

  EmployeeProfileModel? employyeProfile;
  ManagerProfileModel? managerProfile;

  FutureOr<void> _getProfile(
    GetProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final failureOrSections = await getProfile.call(
      isEmployee: event.isEmployee,
    );
    emit(
      failureOrSections.fold(
        (failure) => ProfileState.error(message: failure.message),
        (result) {
          if (event.isEmployee) {
            employyeProfile = EmployeeProfileModel.fromRawJson(result);
            return ProfileState.loaded(employeeProfile: employyeProfile);
          } else {
            managerProfile = ManagerProfileModel.fromRawJson(result);
            return ProfileState.loaded(managerProfile: managerProfile);
          }
        },
      ),
    );
  }

  FutureOr<void> _updateProfile(
    UpdateProfileEvent event,
    Emitter<ProfileState> emit,
  ) async {
    emit(const ProfileState.loading());
    final failureOrSections = await updateProfile.call(event.params);
    emit(
      failureOrSections.fold(
        (failure) => ProfileState.error(message: failure.message),
        (result) =>
            const ProfileState.loaded(employeeProfile: EmployeeProfileModel()),
      ),
    );
  }
}
