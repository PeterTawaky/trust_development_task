import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';

abstract class AddToCartRepo {
  Future<Either<ApiErrorModel, void>> addToCart( );
}
