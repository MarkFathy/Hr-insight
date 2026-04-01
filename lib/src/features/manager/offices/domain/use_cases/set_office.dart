import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class SetOfficeUC extends UseCase<String, SetEmployeeParams> {
  final OfficesRepo repository;
  SetOfficeUC(this.repository);
  @override
  Future<Either<Failure, String>> call(SetEmployeeParams params) async {
    return await repository.setEmployee(params);
  }
}
