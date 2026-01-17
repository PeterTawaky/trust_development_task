import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';

abstract class ProductUseCase<Type, Param> {
  //generics
  Future<Either<ApiErrorModel, Type>> execute([Param param]); //optional param
}

class NoParam {}
