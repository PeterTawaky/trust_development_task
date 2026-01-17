import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartDetailsEntity> fetchCartDetails(String guestId);
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final DioConsumer dio;
  CartRemoteDataSourceImpl(this.dio);

  @override
  Future<CartDetailsEntity> fetchCartDetails(String guestId) async {
    final response = await dio.get(
      ApiConstants.fetchCart,
      queryParameters: {"guest_id": guestId},
    );

    return _mapResponseToEntity(response);
  }

  CartDetailsEntity _mapResponseToEntity(dynamic response) {
    final List<dynamic> itemsJson = response['cart_items'] ?? [];
    final cartItems = itemsJson
        .map(
          (item) => CartItemEntity(
            productId: item['product_id'].toString(),
            productNameEn:
                item['product_name_en'] ?? item['product_name'] ?? '',
            quantity: item['quantity'] ?? 0,
            price: item['price'].toString(),
            image: item['image'] ?? '',
            addons: item['addons'] ?? [],
            total: item['total'].toString(),
          ),
        )
        .toList();

    return CartDetailsEntity(
      cartItems: cartItems,
      totalPrice: response['total_price'].toString(),
      vat: response['VAT'].toString(),
      totalPriceWithTax: response['total_price_with_tax'].toString(),
      totalItems: response['total_items'] ?? 0,
    );
  }
}
