import 'package:dartz/dartz.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/model/localised_message.dart';

Future<Either<Failure, T>> safeApiCall<T>(Future<T> Function() apiCall) async {
  try {
    final result = await apiCall();
    return Right(result);
  } catch (error) {
    return Left(
      Failure(
        code: error.hashCode,
        message: LocalisedMessage('english', 'arabic'),
      ),
    ); //todo handle error
  }
}
