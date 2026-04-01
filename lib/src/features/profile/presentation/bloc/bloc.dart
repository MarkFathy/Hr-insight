import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hr_app/src/features/profile/data/models/employee_profile_model.dart';
import 'package:hr_app/src/features/profile/data/models/manager_profile_model.dart';
import 'package:hr_app/src/features/profile/domain/entities/update_profile_params.dart';
import 'package:hr_app/src/features/profile/domain/use_cases/get_profile.dart';
import 'package:hr_app/src/features/profile/domain/use_cases/update_profile.dart';
part 'event.dart';
part 'state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetProfileUC getProfileUC;
  final UpdateProfileUC updateProfileUC;
  ProfileBloc({required this.getProfileUC, required this.updateProfileUC})
      : super(ProfileInitialState()) {
    on<GetProfileEvent>(_getProfile);
    on<UpdateProfileEvent>(_updateProfile);
  }
  EmployeeProfileModel? employyeProfile;
  ManagerProfileModel? managerProfile;
  FutureOr<void> _getProfile(
      GetProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final failureOrSections = await getProfileUC.call(event.isEmployee);
    emit(failureOrSections.fold((l) => ProfileErrorState(message: l.message),
        (r) {
      if (event.isEmployee) {
        employyeProfile = EmployeeProfileModel.fromJson(r);
        return ProfileLoadedState(employeeProfile: employyeProfile!);
      } else {
        managerProfile = ManagerProfileModel.fromJson(r);
        return ProfileLoadedState(managerProfile: managerProfile!);
      }
    }));
  }

  FutureOr<void> _updateProfile(
      UpdateProfileEvent event, Emitter<ProfileState> emit) async {
    emit(ProfileLoadingState());
    final failureOrSections = await updateProfileUC.call(event.params);
    emit(failureOrSections.fold(
        (l) => ProfileErrorState(message: l.message),
        (r) =>
            const ProfileLoadedState(employeeProfile: EmployeeProfileModel())));
  }
}
