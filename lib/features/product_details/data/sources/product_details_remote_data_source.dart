import 'package:trust_development_task/features/product_details/domain/entities/cart_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';

abstract class ProductDetailsRemoteDataSource {
  Future<ProductDetailsEntity> fetchProductDetails({required String productId});
  Future<List<ProductAddonEntity>> fetchProductAddons({
    required String productId,
  });
  Future<CartEntity> fetchCartTotalItems({required String guestId});
}
