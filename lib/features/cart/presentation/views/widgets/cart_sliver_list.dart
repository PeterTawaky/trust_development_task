import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';
import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_tile.dart';

class CartSliverList extends StatelessWidget {
  final List<CartItemEntity> cartItems;
  const CartSliverList({super.key, required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h(context)),
          child: CartTile(cartItem: cartItems[index]),
        );
      }, childCount: cartItems.length),
    );
  }
}
