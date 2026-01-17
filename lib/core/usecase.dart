import 'package:fpdart/fpdart.dart';

abstract class UseCase<Type, Params> {
  Future<Either<String, Type>> call(Params params);
}

class NoParam {}
