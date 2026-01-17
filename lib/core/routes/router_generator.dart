import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/core/routes/app_routes.dart';
import 'package:trust_development_task/core/widgets/router_error_view.dart';
import 'package:trust_development_task/features/cart/presentation/views/cart_view.dart';
import 'package:trust_development_task/features/home/presentation/views/home_view.dart';
import 'package:trust_development_task/features/product/data/repositories/product_repo_impl.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source_impl.dart';
import 'package:trust_development_task/features/product/domain/use_cases/fetch_category_product_use_case.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';
import 'package:trust_development_task/features/product_details/presentation/views/product_details_view.dart';

class RouterGenerator {
  static GoRouter mainRouting = GoRouter(
    initialLocation: AppRoutes.home,
    errorBuilder: (context, state) {
      return RouterErrorView();
    },
    routes: [
      GoRoute(
        name: AppRoutes.home,
        path: AppRoutes.home,
        builder: (context, state) => HomeView()
      ),
      GoRoute(
        name: AppRoutes.productDetails,
        path: AppRoutes.productDetails,
        builder: (context, state) => ProductDetailsView(),
      ),
      GoRoute(
        name: AppRoutes.cart,
        path: AppRoutes.cart,
        builder: (context, state) => CartView(),
      ),
    ],
  );
}
