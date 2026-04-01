import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/manager/offices/domain/entities/office_details.dart';
import '../repositories/repository.dart';

class GetOfficeDetailsUC extends UseCase<OfficeDetailsEntity, int> {
  final OfficesRepo repository;
  GetOfficeDetailsUC(this.repository);
  @override
  Future<Either<Failure, OfficeDetailsEntity>> call(int params) async {
    return await repository.getOfficeDetails(params);
  }
}
