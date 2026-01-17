import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';

class ProductEntity {
  final String id;
  final String nameEn;
  final String nameAr;
  final String image;
  final int price;
  ProductEntity({
    required this.id,
    required this.nameEn,
    required this.nameAr,
    required this.image,
    required this.price,
  });
  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'].toString(),
      nameEn: json['name_en'] ?? '',
      nameAr: json['name_ar'] ?? '',
      image: json['image'] ?? '',
      price: json['price_tax'] is int
          ? json['price_tax']
          : (json['price_tax'] as num).toInt(),
    );
  }

  String getLocalizedName(BuildContext context) {
    return context.isArabic ? nameAr : nameEn;
  }
}
