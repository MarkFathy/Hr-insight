import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class EditOffice {
  final OfficesRepository repository;
  EditOffice(this.repository);

  ResultFuture<OfficesEntity> call(OfficeParams params) async =>
      repository.editOffice(params);
}

class EditOfficeUseCase extends EditOffice {
  EditOfficeUseCase(super.repository);
}

typedef EditOfficeUC = EditOfficeUseCase;
