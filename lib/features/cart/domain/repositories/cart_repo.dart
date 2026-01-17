import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';

abstract class CartRepo {
  Future<Either<ApiErrorModel, CartDetailsEntity>> fetchCartDetails(
    String guestId,
  );
}
