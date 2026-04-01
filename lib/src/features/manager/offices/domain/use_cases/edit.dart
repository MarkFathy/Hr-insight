import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_params.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import '../repositories/repository.dart';

class EditOfficeUC extends UseCase<OfficesEntity, OfficeParams> {
  final OfficesRepo repository;
  EditOfficeUC(this.repository);
  @override
  Future<Either<Failure, OfficesEntity>> call(OfficeParams params) async {
    return await repository.editOffice(params);
  }
}
