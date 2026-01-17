class ProductDetailsEntity {
  final String id;
  final String nameEn;
  final String nameAr;
  final String descriptionEn;
  final String descriptionAr;
  final String image;
  final int price;

  ProductDetailsEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.descriptionEn,
    required this.descriptionAr,
    required this.image,
    required this.price,
  });

  factory ProductDetailsEntity.fromJson(Map<String, dynamic> json) {
    return ProductDetailsEntity(
      id: json['id'].toString(),
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      descriptionEn: json['description_en'] ?? '',
      descriptionAr: json['description_ar'] ?? '',
      image: json['image'] ?? '',
      price: json['price_tax'] is int
          ? json['price_tax']
          : (json['price_tax'] as num?)?.toInt() ?? 0,
    );
  }
}
