import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/set_employee_params.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class SetEmployeeOffice {
  final OfficesRepository repository;
  SetEmployeeOffice(this.repository);

  ResultFuture<String> call(SetEmployeeParams params) async =>
      repository.setEmployee(params);
}

class SetOfficeUseCase extends SetEmployeeOffice {
  SetOfficeUseCase(super.repository);
}

typedef SetOfficeUC = SetOfficeUseCase;
