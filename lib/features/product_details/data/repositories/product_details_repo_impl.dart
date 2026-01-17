import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_handler.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product_details/data/sources/product_details_remote_data_source.dart';
import 'package:trust_development_task/features/product_details/domain/entities/cart_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:trust_development_task/features/product_details/domain/repositories/product_details_repo.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteDataSource productDetailsRemoteDataSource;

  ProductDetailsRepoImpl(this.productDetailsRemoteDataSource);

  @override
  Future<Either<ApiErrorModel, ProductDetailsEntity>> fetchProductDetails({
    required String productId,
  }) async {
    try {
      final result = await productDetailsRemoteDataSource.fetchProductDetails(
        productId: productId,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, List<ProductAddonEntity>>> fetchProductAddons({
    required String productId,
  }) async {
    try {
      final result = await productDetailsRemoteDataSource.fetchProductAddons(
        productId: productId,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<ApiErrorModel, CartEntity>> fetchCartTotalItems({
    required String guestId,
  }) async {
    try {
      final result = await productDetailsRemoteDataSource.fetchCartTotalItems(
        guestId: guestId,
      );
      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
