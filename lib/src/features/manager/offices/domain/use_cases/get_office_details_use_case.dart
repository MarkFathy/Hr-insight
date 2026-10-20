import 'package:hr_app/src/core/functional/typedefs.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class GetOfficeDetailsUseCase {
  final OfficesRepo repository;
  GetOfficeDetailsUseCase(this.repository);

  ResultFuture<OfficeDetailsEntity> call(int id) async => repository.getOfficeDetails(id);
}

typedef GetOfficeDetailsUC = GetOfficeDetailsUseCase;
