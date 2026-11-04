import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class DeleteOffice {
  final OfficesRepository repository;
  DeleteOffice(this.repository);

  ResultFuture<OfficesEntity> call(int id) async => repository.deleteOffice(id);
}

class DeleteOfficeUseCase extends DeleteOffice {
  DeleteOfficeUseCase(super.repository);
}

typedef DeleteOfficeUC = DeleteOfficeUseCase;
