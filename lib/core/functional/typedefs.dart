import 'package:fpdart/fpdart.dart';
import 'package:hr_app/core/error/app_failure.dart';

/// Standard asynchronous result contract for operations returning [T] or [AppFailure].
typedef ResultFuture<T> = Future<Either<AppFailure, T>>;

/// Standard asynchronous result contract for operations with no return value.
typedef ResultVoid = ResultFuture<Unit>;
