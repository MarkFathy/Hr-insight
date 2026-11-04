import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_failure.freezed.dart';

@freezed
sealed class AppFailure with _$AppFailure {
  const factory AppFailure.offline({
    @Default('No internet connection') String message,
  }) = OfflineFailure;

  const factory AppFailure.server({required String message, int? statusCode}) =
      ServerFailure;

  const factory AppFailure.unauthorized({
    @Default('Unauthorized access') String message,
  }) = UnauthorizedFailure;

  const factory AppFailure.emptyCache({
    @Default('No cached data available') String message,
  }) = EmptyCacheFailure;

  const factory AppFailure.location({required String message}) =
      LocationFailure;

  const factory AppFailure.fingerprint({required String message}) =
      FingerprintFailure;

  const factory AppFailure.unexpected({
    @Default('An unexpected error occurred') String message,
  }) = UnexpectedFailure;
}
