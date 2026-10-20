import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class SetOfficeUseCase {
  final OfficesRepo repository;
  SetOfficeUseCase(this.repository);

  ResultFuture<String> call(SetEmployeeParams params) async => repository.setEmployee(params);
}

typedef SetOfficeUC = SetOfficeUseCase;
