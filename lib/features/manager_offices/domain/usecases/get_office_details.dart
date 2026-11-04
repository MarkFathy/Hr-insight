import 'package:hr_app/core/functional/typedefs.dart';
import 'package:hr_app/features/manager_offices/domain/entities/office_details.dart';
import 'package:hr_app/features/manager_offices/domain/repositories/offices_repository.dart';

class GetOfficeDetails {
  final OfficesRepository repository;
  GetOfficeDetails(this.repository);

  ResultFuture<OfficeDetailsEntity> call(int id) async =>
      repository.getOfficeDetails(id);
}

class GetOfficeDetailsUseCase extends GetOfficeDetails {
  GetOfficeDetailsUseCase(super.repository);
}

typedef GetOfficeDetailsUC = GetOfficeDetailsUseCase;
