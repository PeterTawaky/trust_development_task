import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/core/utils/app_strings.dart';
import 'package:trust_development_task/features/product/data/repositories/product_repo_impl.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source_impl.dart';
import 'package:trust_development_task/features/product/domain/use_cases/fetch_category_product_use_case.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';
import 'package:trust_development_task/features/product/presentation/views/product_view.dart';

class HomeViewBody extends StatelessWidget {
  final ValueNotifier<int> selected;
  final ValueNotifier<PageController> controller;
  const HomeViewBody({
    super.key,
    required this.controller,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: PageView(
        onPageChanged: (value) => selected.value = value,
        controller: controller.value,
        children: [
          BlocProvider(
            create: (context) => ProductCategoryCubit(
              FetchCategoryProductUseCase(
                ProductRepoImpl(
                  productRemoteDataSource: ProductRemoteDataSourceImpl(
                    DioConsumer(),
                  ),
                ),
              ),
            )..fetchCategoryProducts(),
            child: ProductView(),
          ),
          Center(child: Text(AppStrings.menu)),
          Center(child: Text(AppStrings.offers)),
          Center(child: Text(AppStrings.account)),
        ],
      ),
    );
  }
}
