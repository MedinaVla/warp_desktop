import 'package:dartz/dartz.dart';
import 'package:errors/errors.dart';

///UseCase  Template
// ignore: one_member_abstracts
abstract class UseCase<Type, Params> {
  ///Call Function
  Future<Either<Failure, Type>> call(Params params);
}
