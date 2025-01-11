import 'package:fpdart/fpdart.dart';
import 'package:test_task/src/core/error/failure.dart';

abstract interface class UseCase<SuccessType, Params> {
  Future<Either<Failure, SuccessType>> call(Params params);
}

class NoParams {}
