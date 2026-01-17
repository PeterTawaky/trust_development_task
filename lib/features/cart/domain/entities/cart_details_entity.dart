class CartDetailsEntity {
  final List<CartItemEntity> cartItems;
  final String totalPrice;
  final String vat;
  final String totalPriceWithTax;
  final int totalItems;

  CartDetailsEntity({
    required this.cartItems,
    required this.totalPrice,
    required this.vat,
    required this.totalPriceWithTax,
    required this.totalItems,
  });
}

class CartItemEntity {
  final String productId;
  final String productNameEn;
  final int quantity;
  final String price;
  final String image;
  final List<dynamic> addons;
  final String total;

  CartItemEntity({
    required this.productId,
    required this.productNameEn,
    required this.quantity,
    required this.price,
    required this.image,
    required this.addons,
    required this.total,
  });
}
