import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product_details/domain/entities/cart_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRepo {
  Future<Either<ApiErrorModel, ProductDetailsEntity>> fetchProductDetails({
    required String productId,
  });
  Future<Either<ApiErrorModel, List<ProductAddonEntity>>> fetchProductAddons({
    required String productId,
  });
  Future<Either<ApiErrorModel, CartEntity>> fetchCartTotalItems({
    required String guestId,
  });
}
