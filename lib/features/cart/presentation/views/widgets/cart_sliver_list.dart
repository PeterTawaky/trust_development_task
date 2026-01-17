// import 'package:flutter/material.dart';
// import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
// import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_tile.dart';
// import 'package:trust_development_task/features/product/presentation/views/product_view.dart';

// class CartSliverList extends StatelessWidget {
//   const CartSliverList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SliverList(
//       delegate: SliverChildBuilderDelegate((context, index) {
//         return Padding(
//           padding: EdgeInsets.symmetric(vertical: 20.h(context)),
//           child: CartTile(
//             productModel: categoryProductViewModel.products[index],
//           ),
//         );
//       }, childCount: categoryProductViewModel.products.length),
//     );
//   }
// }
