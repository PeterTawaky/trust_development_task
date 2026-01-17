import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_counter.dart';
import 'package:skeletonizer/skeletonizer.dart';

import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';
import 'package:trust_development_task/locale_keys.dart';

class CartTile extends StatelessWidget {
  final CartItemEntity cartItem;
  const CartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CachedNetworkImage(
              height: 50.h(context),
              width: 50.w(context),
              imageUrl: cartItem.image,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r(context)),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (context, url) => Skeletonizer(
                child: Container(
                  height: 50.h(context),
                  width: 50.w(context),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r(context)),
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartItem.productNameEn,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    Text(
                      '${cartItem.price} ${LocaleKeys.le}',
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CartCounter(
              initialValue: cartItem.quantity,
              onIncrement: () {
                context.read<CartCubit>().addToCart(
                  productId: cartItem.productId,
                  quantity: 1,
                  addons: cartItem.addons,
                );
              },
              onDecrement: () {
                context.read<CartCubit>().addToCart(
                  productId: cartItem.productId,
                  quantity: -1,
                  addons: cartItem.addons,
                );
              },
            ),
          ],
        ),
        if (cartItem.addons.isNotEmpty) ...[
          SizedBox(height: 4.h(context)),
          Row(
            children: [
              SizedBox(width: 58.w(context)),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      LocaleKeys.extras,
                      style: context.theme.textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Wrap(
                      spacing: 8.w(context),
                      children: cartItem.addons.map((addon) {
                        String addonName = '';
                        if (addon is String) {
                          addonName = addon;
                        } else if (addon is Map) {
                          addonName = addon['name'] ?? '';
                        }
                        return Text(
                          addonName,
                          style: context.theme.textTheme.bodySmall,
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
