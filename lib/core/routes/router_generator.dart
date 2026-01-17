import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/dependencies/service_locator.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/core/widgets/router_error_view.dart';
import 'package:trust_development_task/features/cart/presentation/views/cart_view.dart';
import 'package:trust_development_task/features/home/presentation/views/home_view.dart';
import 'package:trust_development_task/features/product_details/presentation/managers/cubit/product_details_cubit.dart';
import 'package:trust_development_task/features/product_details/presentation/views/product_details_view.dart';

class RouterGenerator {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static GoRouter mainRouting = GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.home,
    errorBuilder: (context, state) {
      return const RouterErrorView();
    },
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        name: AppRoutes.productDetails,
        path: AppRoutes.productDetails,
        builder: (context, state) {
          return BlocProvider(
            create: (context) =>
                getIt<ProductDetailsCubit>()
                  ..fetchProductDetails(state.extra as String),
            child: const ProductDetailsView(),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.cart,
        path: AppRoutes.cart,
        builder: (context, state) => CartView(),
      ),
    ],
  );
}
