import 'package:dartz/dartz.dart';

abstract class BaseUsecase<In, Out> {
  Future<Either<String, Out>> execute(In input);
}
