import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';

abstract class ProductRemoteDataSource {
  Future<List<CategoryProductEntity>> fetchCategoryProduct();
}
