import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';

class ProductRemoteDataSourceImpl extends ProductRemoteDataSource {
  DioConsumer dioConsumer;

  ProductRemoteDataSourceImpl(this.dioConsumer);
  @override
  Future<List<CategoryProductEntity>> fetchCategoryProduct() async {
    var response = await dioConsumer.get(
      ApiConstants.productCategory,
      // queryParameters: {},
    );
    List<CategoryProductEntity> productsCategory = toModelConversion(response);
    return productsCategory;
  }

  // @override
  // Future<void> addToCart() async {
  //   var response = await dioConsumer.post(
  //     ApiConstants.addToCart,
  //     data: {
  //       "guest_id": "guest_696a48a32130f",
  //       "items": [
  //         {
  //           "product_id": 100,
  //           "quantity": 2,
  //           "addons": [
  //             {"id": 789, "name": "Extra Cheese", "price": "5.00"},
  //           ],
  //         },
  //       ],
  //     },
  //   );
  // }
}

List<CategoryProductEntity> toModelConversion(List response) {
  return response.map((e) => CategoryProductEntity.fromJson(e)).toList();
}
