import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';

abstract class ProductRepo {
  Future<Either<ApiErrorModel, List<CategoryProductEntity>>>
  fetchCategoryProducts();
}
