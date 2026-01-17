import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/product/domain/entities/product_entity.dart';
import 'package:trust_development_task/features/product/presentation/views/widgets/product_tile.dart';

class ProductsSliverList extends StatelessWidget {
  final List<ProductEntity> products;
  const ProductsSliverList({
    super.key,
    required this.products,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 8.h(context)),
          child: ProductTile(
            productModel: products[index],
          ),
        );
      }, childCount: products.length),
    );
  }
}

