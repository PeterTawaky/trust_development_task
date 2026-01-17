// import 'package:flutter/material.dart';
// import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
// import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
// import 'package:trust_development_task/core/widgets/back_arrow.dart';
// import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_sliver_list.dart';
// import 'package:trust_development_task/features/product_details/presentation/views/widgets/product_details_view_body.dart';

// class CartViewBody extends StatelessWidget {
//   const CartViewBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Padding(
//         padding: EdgeInsets.symmetric(
//           horizontal: 20.w(context),
//           vertical: 10.h(context),
//         ),
//         child: Stack(
//           children: [
//             CustomScrollView(
//               physics: const BouncingScrollPhysics(),
//               slivers: [
//                 SliverToBoxAdapter(
//                   child: SizedBox(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         BackArrow(),
//                         Text('Cart', style: context.theme.textTheme.bodyLarge),
//                         SizedBox(width: 80.w(context)),
//                       ],
//                     ),
//                   ),
//                 ),
//                 CartSliverList(),
//                 SliverToBoxAdapter(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(height: 10.h(context)),
//                       Text(
//                         'Payment Details',
//                         style: context.theme.textTheme.titleLarge,
//                       ),
//                       Divider(thickness: 0.3),
//                       SizedBox(height: 10.h(context)),
//                       Row(
//                         children: [
//                           Text(
//                             'Order',
//                             style: context.theme.textTheme.bodyLarge,
//                           ),
//                           Spacer(),
//                           Text(
//                             '250 LE',
//                             style: context.theme.textTheme.titleLarge,
//                           ),
//                           Divider(thickness: 0.3),
//                         ],
//                       ),
//                       SizedBox(height: 10.h(context)),
//                       Row(
//                         children: [
//                           Text(
//                             'Subtotal',
//                             style: context.theme.textTheme.bodyLarge,
//                           ),
//                           Spacer(),
//                           Text(
//                             '30 LE',
//                             style: context.theme.textTheme.titleLarge,
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: 10.h(context)),
//                       Row(
//                         children: [
//                           Text(
//                             'Total',
//                             style: context.theme.textTheme.bodyLarge,
//                           ),
//                           Spacer(),
//                           Text(
//                             '280 LE',
//                             style: context.theme.textTheme.titleLarge,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             ActionButton(title: 'Continue to Pay'),
//           ],
//         ),
//       ),
//     );
//   }
// }
