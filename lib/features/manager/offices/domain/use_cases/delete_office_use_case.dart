import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager/offices/domain/repositories/repository.dart';

class DeleteOfficeUseCase {
  final OfficesRepo repository;
  DeleteOfficeUseCase(this.repository);

  ResultFuture<OfficesEntity> call(int id) async => repository.deleteOffice(id);
}

typedef DeleteOfficeUC = DeleteOfficeUseCase;
