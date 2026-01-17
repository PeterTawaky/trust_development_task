class CartEntity {
  final int totalItems;

  CartEntity({required this.totalItems});

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(totalItems: json['total_items'] ?? 0);
  }
}
