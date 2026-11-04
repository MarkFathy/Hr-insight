import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';

part 'offices_event.freezed.dart';

@freezed
sealed class OfficesEvent with _$OfficesEvent {
  const factory OfficesEvent.getOffices() = GetOfficesEvent;
  const factory OfficesEvent.addOffice({OfficeParams? params}) = AddOfficeEvent;
  const factory OfficesEvent.setEmployee({required SetEmployeeParams params}) =
      SetEmployeeEvent;
  const factory OfficesEvent.editOffice({
    required int id,
    OfficeParams? params,
  }) = EditOfficeEvent;
  const factory OfficesEvent.deleteOffices(int id) = DeleteOfficesEvent;
  const factory OfficesEvent.getOfficeDetails(int id) = GetOfficeDetailsEvent;
}
