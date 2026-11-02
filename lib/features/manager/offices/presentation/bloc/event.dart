import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hr_app/features/manager/offices/domain/entities/set_employee_params.dart';

part 'event.freezed.dart';

@freezed
sealed class OfficesEvent with _$OfficesEvent {
  const factory OfficesEvent.getOffices() = GetOfficesEvent;
  const factory OfficesEvent.addOffice() = AddOfficeEvent;
  const factory OfficesEvent.setEmployee({required SetEmployeeParams params}) =
      SetEmployeeEvent;
  const factory OfficesEvent.editOffice({required int id}) = EditOfficeEvent;
  const factory OfficesEvent.deleteOffices(int id) = DeleteOfficesEvent;
  const factory OfficesEvent.getOfficeDetails(int id) = GetOfficeDetailsEvent;
}
