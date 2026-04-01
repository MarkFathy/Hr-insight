import 'package:dartz/dartz.dart';
import 'package:hr_app/src/core/error/failures.dart';
import 'package:hr_app/src/core/usecases/usecase.dart';
import 'package:hr_app/src/features/employee/leaves/data/models/leave_model.dart';
import '../repositories/repository.dart';

class GetLeavesUC extends UseCase<LeavesModel, NoParams> {
  final LeavesRepo repository;
  GetLeavesUC(this.repository);
  @override
  Future<Either<Failure, LeavesModel>> call(NoParams params) async {
    return await repository.getLeaves();
  }
}
