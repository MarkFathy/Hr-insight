import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/offices_entity.dart';
import '../repositories/repository.dart';

class GetOfficesUC extends UseCase<OfficesEntity, NoParams> {
  final OfficesRepo repository;
  GetOfficesUC(this.repository);
  @override
  Future<Either<Failure, OfficesEntity>> call(NoParams params) async {
    return await repository.getOffices();
  }
}
