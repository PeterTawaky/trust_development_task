import 'package:trust_development_task/features/product/domain/entities/product_entity.dart';

class CategoryProductEntity {
  final String id;
  final String categoryTitleAr;
  final String categoryTitleEn;
  final String categoryImage;

  final List<ProductEntity> products;

  CategoryProductEntity({
    required this.categoryImage,
    required this.products,
    required this.categoryTitleAr,
    required this.categoryTitleEn,
    required this.id,
  });

  factory CategoryProductEntity.fromJson(Map<String, dynamic> json) {
    return CategoryProductEntity(
      id: json['id'].toString(),
      categoryTitleAr: json['name_ar'] ?? '',
      categoryTitleEn: json['name_en'] ?? '',
      categoryImage: json['image'] ?? '',
      products:
          (json['products'] as List?)
              ?.map((item) => ProductEntity.fromJson(item))
              .toList() ??
          [],
    );
  }
}

