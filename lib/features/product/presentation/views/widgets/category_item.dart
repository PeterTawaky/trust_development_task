import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/product/domain/entities/category_entity.dart';

class CategoryItem extends StatelessWidget {
  final CategoryEntity categoryEntity;
  const CategoryItem({
    super.key,
    required this.categoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        vertical: 2.h(context),
        horizontal: 12.w(context),
      ),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.primary,
        borderRadius: BorderRadius.circular(30.r(context)),
      ),
      child: Row(
        children: [
          CachedNetworkImage(
            height: 25.h(context),
            width: 25.w(context),
            imageUrl: categoryEntity.image,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) =>
                const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error),
          ),
          SizedBox(width: 5.w(context)),
          Text(
            categoryEntity.nameEn, //will be edited to add arabic
            style: TextStyle(
              color: context.theme.scaffoldBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}