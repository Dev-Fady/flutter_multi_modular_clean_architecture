import 'package:dartz/dartz.dart';
import 'package:data/network_info/network_info.dart';
import 'package:domain/model/failure.dart';
import 'package:domain/model/localised_message.dart';

Future<Either<Failure, T>> safeApiCall<T>(
    NetworkInfo networkInfo, Future<T> Function() apiCall) async {
  if (await networkInfo.isConnected) {
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
  } else {
    return Left(
      Failure(
        code: -500,
        message: LocalisedMessage(
            'en No internet connection ', ' ar No internet connection'),
      ),
    );
  }
}
