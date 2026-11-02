import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';

part 'state.freezed.dart';

@freezed
sealed class OfficesState with _$OfficesState {
  const factory OfficesState.initial() = OfficesInitialState;
  const factory OfficesState.loading() = OfficesLoadingState;
  const factory OfficesState.loaded({required OfficesEntity offices}) =
      OfficesLoadedState;
  const factory OfficesState.officeDetailsLoaded({
    required OfficeDetailsEntity details,
  }) = OfficeDetailsLoadedState;
  const factory OfficesState.modified({String? message}) = OfficesModifiedState;
  const factory OfficesState.error({required String message}) =
      OfficesErrorState;
}
