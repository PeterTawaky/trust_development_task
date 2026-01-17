import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/api_consumer.dart';
import 'package:trust_development_task/features/product_details/data/sources/product_details_remote_data_source.dart';
import 'package:trust_development_task/features/product_details/domain/entities/cart_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';

class ProductDetailsRemoteDataSourceImpl
    extends ProductDetailsRemoteDataSource {
  final ApiConsumer apiConsumer;

  ProductDetailsRemoteDataSourceImpl(this.apiConsumer);

  @override
  Future<ProductDetailsEntity> fetchProductDetails({
    required String productId,
  }) async {
    final response = await apiConsumer.get(
      ApiConstants.productDetails,
      queryParameters: {'product_id': productId},
    );

    if (response is List && response.isNotEmpty) {
      return ProductDetailsEntity.fromJson(response[0]);
    } else {
      throw Exception('Unexpected response format or empty list');
    }
  }

  @override
  Future<List<ProductAddonEntity>> fetchProductAddons({
    required String productId,
  }) async {
    final response = await apiConsumer.get(
      ApiConstants.productAddons,
      queryParameters: {'product_id2': productId},
    );

    if (response is Map<String, dynamic> && response.containsKey('blocks')) {
      final List blocks = response['blocks'];
      final List<ProductAddonEntity> addons = [];
      for (var block in blocks) {
        if (block['addons'] != null) {
          addons.addAll(
            (block['addons'] as List).map(
              (addon) => ProductAddonEntity.fromJson(addon),
            ),
          );
        }
      }
      return addons;
    } else {
      throw Exception('Unexpected response format');
    }
  }

  @override
  Future<CartEntity> fetchCartTotalItems({required String guestId}) async {
    final response = await apiConsumer.get(
      ApiConstants.addToCart,
      queryParameters: {'guest_id': guestId},
    );

    if (response is Map<String, dynamic>) {
      return CartEntity.fromJson(response);
    } else {
      throw Exception('Unexpected response format');
    }
  }
}
