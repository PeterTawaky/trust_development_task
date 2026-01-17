import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/cart/presentation/views/widgets/cart_counter.dart';
import 'package:trust_development_task/features/product/domain/entities/product_entity.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CartTile extends StatelessWidget {
  final ProductEntity productModel;
  const CartTile({super.key, required this.productModel});

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
              imageUrl: productModel.image,
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
                      productModel.nameEn,
                      style: context.theme.textTheme.bodyLarge,
                    ),
                    Text(
                      productModel.price.toString(),
                      style: context.theme.textTheme.titleLarge!.copyWith(
                        color: context.theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CartCounter(),
          ],
        ),
        SizedBox(height: 4.h(context)),
        Row(
          children: [
            SizedBox(width: 5.w(context)),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Extras', style: context.theme.textTheme.bodyLarge),
                Wrap(
                  children: [
                    Text('Extra 1'),
                    Text('Extra 2'),
                    Text('Extra 3'),
                    Text('Extra 4'),
                    Text('Extra 5'),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
