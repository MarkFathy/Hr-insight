import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class EditOfficeUseCase {
  final OfficesRepo repository;
  EditOfficeUseCase(this.repository);

  ResultFuture<OfficesEntity> call(OfficeParams params) async => repository.editOffice(params);
}

typedef EditOfficeUC = EditOfficeUseCase;
