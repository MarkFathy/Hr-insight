import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/offices_entity.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class GetOffices {
  final OfficesRepository repository;
  GetOffices(this.repository);

  ResultFuture<OfficesEntity> call() async => repository.getOffices();
}

class GetOfficesUseCase extends GetOffices {
  GetOfficesUseCase(super.repository);
}

typedef GetOfficesUC = GetOfficesUseCase;
