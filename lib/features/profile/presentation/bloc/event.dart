import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/profile/domain/entities/update_profile_params.dart';

part 'event.freezed.dart';

@freezed
sealed class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getProfile({required bool isEmployee}) =
      GetProfileEvent;
  const factory ProfileEvent.updateProfile(UpdateProfileParams params) =
      UpdateProfileEvent;
}
