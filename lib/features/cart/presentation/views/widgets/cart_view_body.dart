import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/core/widgets/back_arrow.dart';
import 'package:trust_development_task/core/widgets/custom_loading_widget.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_sliver_list.dart';
import 'package:trust_development_task/features/product_details/presentation/views/widgets/product_details_view_body.dart';
import 'package:trust_development_task/locale_keys.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state is CartLoading) {
          return const CustomLoadingWidget();
        } else if (state is CartError) {
          return Center(child: Text(LocaleKeys.errorLoadingCart));
        } else if (state is CartSuccess && state.cartDetails != null) {
          final cart = state.cartDetails!;
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.w(context),
                vertical: 10.h(context),
              ),
              child: Stack(
                children: [
                  CustomScrollView(
                    physics: const BouncingScrollPhysics(),
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const BackArrow(),
                              Text(
                                LocaleKeys.cart,
                                style: context.theme.textTheme.bodyLarge,
                              ),
                              SizedBox(width: 80.w(context)),
                            ],
                          ),
                        ),
                      ),
                      CartSliverList(cartItems: cart.cartItems),
                      SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h(context)),
                            Text(
                              LocaleKeys.paymentDetails,
                              style: context.theme.textTheme.titleLarge,
                            ),
                            const Divider(thickness: 0.3),
                            SizedBox(height: 10.h(context)),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.order,
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                Text(
                                  '${cart.totalPrice} ${LocaleKeys.le}',
                                  style: context.theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                            const Divider(thickness: 0.3),
                            SizedBox(height: 10.h(context)),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.vat,
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                Text(
                                  '${cart.vat} ${LocaleKeys.le}',
                                  style: context.theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h(context)),
                            Row(
                              children: [
                                Text(
                                  LocaleKeys.total,
                                  style: context.theme.textTheme.bodyLarge,
                                ),
                                const Spacer(),
                                Text(
                                  '${cart.totalPriceWithTax} ${LocaleKeys.le}',
                                  style: context.theme.textTheme.titleLarge,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 100.h(context),
                            ), // Spacer for button
                          ],
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: ActionButton(
                      title: LocaleKeys.continueToPay,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return Center(child: Text(LocaleKeys.cartEmpty));
        }
      },
    );
  }
}
