import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trust_development_task/core/dependencies/service_locator.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';
import 'package:trust_development_task/features/product/presentation/views/product_view.dart';
import 'package:trust_development_task/features/home/presentation/views/widgets/account_view.dart';
import 'package:trust_development_task/locale_keys.dart';

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
            create: (context) =>
                getIt<ProductCategoryCubit>()..fetchCategoryProducts(),
            child: const ProductView(),
          ),
          Center(child: Text(LocaleKeys.menu)),
          Center(child: Text(LocaleKeys.offers)),
          const AccountView(),
        ],
      ),
    );
  }
}
