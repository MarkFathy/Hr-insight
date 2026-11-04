import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class AddOffice {
  final OfficesRepository repository;
  AddOffice(this.repository);

  ResultFuture<OfficesEntity> call(OfficeParams params) async =>
      repository.addOffice(params);
}

class AddOfficeUseCase extends AddOffice {
  AddOfficeUseCase(super.repository);
}

typedef AddOfficeUC = AddOfficeUseCase;
