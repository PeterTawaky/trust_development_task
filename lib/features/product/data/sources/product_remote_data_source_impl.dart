import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  DioConsumer dioConsumer;

  ProductRemoteDataSourceImpl(this.dioConsumer);
  @override
  Future<List<CategoryProductEntity>> fetchCategoryProduct() async {
    var response = await dioConsumer.get(ApiConstants.productCategory);
    List<CategoryProductEntity> productsCategory = toModelConversion(response);
    return productsCategory;
  }
}

List<CategoryProductEntity> toModelConversion(List response) {
  return response.map((e) => CategoryProductEntity.fromJson(e)).toList();
}
