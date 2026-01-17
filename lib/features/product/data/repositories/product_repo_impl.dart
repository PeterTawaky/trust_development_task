import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_handler.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';
import 'package:trust_development_task/features/product/domain/repositories/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteDataSource productRemoteDataSource;
  ProductRepoImpl({required this.productRemoteDataSource});
  @override
  Future<Either<ApiErrorModel, List<CategoryProductEntity>>>
  fetchCategoryProducts() async {
    try {
      List<CategoryProductEntity> productsCategory;
      productsCategory = await productRemoteDataSource.fetchCategoryProduct();
      return Right(productsCategory);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
