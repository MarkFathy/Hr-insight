import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager/offices/domain/repositories/repository.dart';

class AddOfficeUseCase {
  final OfficesRepo repository;
  AddOfficeUseCase(this.repository);

  ResultFuture<OfficesEntity> call(OfficeParams params) async =>
      repository.addOffice(params);
}

typedef AddOfficeUC = AddOfficeUseCase;
