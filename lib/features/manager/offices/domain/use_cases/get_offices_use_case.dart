import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager/offices/domain/repositories/repository.dart';

class GetOfficesUseCase {
  final OfficesRepo repository;
  GetOfficesUseCase(this.repository);

  ResultFuture<OfficesEntity> call() async => repository.getOffices();
}

typedef GetOfficesUC = GetOfficesUseCase;
