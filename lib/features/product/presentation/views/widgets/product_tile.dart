import 'package:animate_to/animate_to.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/product/domain/entities/product_entity.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';

class ProductTile extends StatelessWidget {
  final ProductEntity productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.pushNamed(AppRoutes.productDetails),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 100.h(context),
            width: 110.w(context),
            imageUrl: productModel.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r(context)),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => Skeletonizer(
              child: Container(
                height: 100.h(context),
                width: 110.w(context),
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
                    style: context.theme.textTheme.titleLarge,
                  ),
                ],
              ),
            ),
          ),
          AnimateFrom(
            key: context.read<AnimateToController>().tag(
              productModel.id,
            ), // Unique key per product
            child: IconButton(
              onPressed: () {
                final controller = context.read<AnimateToController>();
                controller.animate(controller.tag(productModel.id));
                context.read<ProductCategoryCubit>().addToCart(productId: productModel.id,quantity: 1,);
              },
              icon: Container(
                padding: EdgeInsets.all(4.r(context)),
                decoration: BoxDecoration(
                  color: context.colorsScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.add,
                  
                  color: context.theme.scaffoldBackgroundColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
