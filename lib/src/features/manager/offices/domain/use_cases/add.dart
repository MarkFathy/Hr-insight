import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class AddOfficeUC extends UseCase<OfficesEntity, OfficeParams> {
  final OfficesRepo repository;
  AddOfficeUC(this.repository);
  @override
  Future<Either<Failure, OfficesEntity>> call(OfficeParams params) async {
    return await repository.addOffice(params);
  }
}
