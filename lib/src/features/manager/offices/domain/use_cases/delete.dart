import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import 'package:hr_app/src/features/manager/offices/domain/repositories/repository.dart';

class DeleteOfficeUC extends UseCase<OfficesEntity, int> {
  final OfficesRepo repository;
  DeleteOfficeUC(this.repository);
  @override
  Future<Either<Failure, OfficesEntity>> call(int params) async {
    return await repository.deleteOffice(params);
  }
}
