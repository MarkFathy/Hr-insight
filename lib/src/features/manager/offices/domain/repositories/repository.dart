import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';

abstract class OfficesRepo {
  Future<Either<Failure, OfficesEntity>> getOffices();
  Future<Either<Failure, OfficesEntity>> addOffice(OfficeParams params);
  Future<Either<Failure, OfficesEntity>> editOffice(OfficeParams params);
  Future<Either<Failure, OfficesEntity>> deleteOffice(int id);
  Future<Either<Failure, OfficeDetailsEntity>> getOfficeDetails(int id);
  Future<Either<Failure, String>> setEmployee(SetEmployeeParams params);
}
