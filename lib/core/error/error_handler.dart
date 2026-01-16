import 'package:dio/dio.dart';

import 'package:fpdart/fpdart.dart';

import 'failure.dart';
import 'dio_exception_handler.dart';

Future<Either<Failure, T>> handleNetworkError<T>(
  Future<T> Function() apiCall,
) async {
  try {
    final response = await apiCall();

    return Right(response);
  } catch (e) {
    if (e is DioException) {
      final customError = CustomDioException.fromDioError(e);
      return Left(NetworkFailure(message: customError.customMessage));
    }
    // else if (e is FirebaseException) {
    //   return Left(NetworkFailure(message: e.message.toString()));
    // }
    else {
      return Left(
        NetworkFailure(message: e.toString()),
      );
    }
  }
}
