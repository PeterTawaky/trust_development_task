import 'package:flutter/material.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/features/product/domain/entities/category_entity.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';
import 'package:trust_development_task/features/product/presentation/views/widgets/category_item.dart';

class CategoriesHorizontalList extends StatelessWidget {
  final List<CategoryProductEntity> categoryProductViewModel;
  const CategoriesHorizontalList({
    super.key,
    required this.categoryProductViewModel,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(width: 8.w(context)),
      scrollDirection: Axis.horizontal,
      itemCount: categoryProductViewModel.length,
      itemBuilder: (context, index) => CategoryItem(
        categoryEntity: CategoryEntity(
          id: categoryProductViewModel[index].id,
          nameEn: categoryProductViewModel[index].categoryTitleEn,
          nameAr: categoryProductViewModel[index].categoryTitleAr,
          image: categoryProductViewModel[index].categoryImage,
        ),
      ),
    );
  }
}
