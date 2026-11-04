import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_details.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';

abstract interface class OfficesRepository {
  ResultFuture<OfficesEntity> getOffices();
  ResultFuture<OfficesEntity> addOffice(OfficeParams params);
  ResultFuture<OfficesEntity> editOffice(OfficeParams params);
  ResultFuture<OfficesEntity> deleteOffice(int id);
  ResultFuture<OfficeDetailsEntity> getOfficeDetails(int id);
  ResultFuture<String> setEmployee(SetEmployeeParams params);
}

typedef OfficesRepo = OfficesRepository;
