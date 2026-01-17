import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/core/utils/extensions/context_extensions.dart';
import 'package:trust_development_task/core/utils/extensions/num_extensions.dart';
import 'package:trust_development_task/core/widgets/custom_loading_widget.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';
import 'package:trust_development_task/features/product/presentation/views/widgets/categories_horizontal_list.dart';
import 'package:trust_development_task/features/product/presentation/views/widgets/products_sliver_list.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCategoryCubit, ProductCategoryState>(
      builder: (context, state) {
        if (state is ProductCategorySuccess) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w(context)),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 40.h(context),
                    child: CategoriesHorizontalList(
                      categoryProductViewModel: state.categoryProducts,
                    ),
                  ),
                ),
                SliverToBoxAdapter(child: SizedBox(height: 20.h(context))),

                SliverToBoxAdapter(
                  child: Text(
                    state.categoryProducts[0].getLocalizedTitle(context),
                    style: context.theme.textTheme.headlineLarge,
                  ),
                ),
                // number must be changed later
                ProductsSliverList(
                  products: state.categoryProducts[0].products,
                ),
              ],
            ),
          );
        } else if (state is ProductCategoryError) {
          return Center(child: Text(state.error.message));
        } else {
          return CustomLoadingWidget(isDarkMode: context.isDark);
        }
      },
    );
  }
}
