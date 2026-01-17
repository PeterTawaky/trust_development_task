import 'package:get_it/get_it.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/cart/data/repositories/cart_repo_impl.dart';
import 'package:trust_development_task/features/cart/data/sources/cart_remote_data_source.dart';
import 'package:trust_development_task/features/cart/domain/repositories/cart_repo.dart';
import 'package:trust_development_task/features/cart/domain/use_cases/fetch_cart_details_use_case.dart';
import 'package:trust_development_task/features/cart/presentation/managers/cubit/cart_cubit.dart';
import 'package:trust_development_task/features/product/data/repositories/product_repo_impl.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source.dart';
import 'package:trust_development_task/features/product/data/sources/product_remote_data_source_impl.dart';
import 'package:trust_development_task/features/product/domain/repositories/product_repo.dart';
import 'package:trust_development_task/features/product/domain/use_cases/fetch_category_product_use_case.dart';
import 'package:trust_development_task/features/product/presentation/managers/cubit/product_category_cubit.dart';
import 'package:trust_development_task/features/product_details/data/repositories/product_details_repo_impl.dart';
import 'package:trust_development_task/features/product_details/data/sources/product_details_remote_data_source.dart';
import 'package:trust_development_task/features/product_details/data/sources/product_details_remote_data_source_impl.dart';
import 'package:trust_development_task/features/product_details/domain/repositories/product_details_repo.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_cart_total_items_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_product_addons_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';
import 'package:trust_development_task/features/product_details/presentation/managers/cubit/product_details_cubit.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Core
  getIt.registerLazySingleton<DioConsumer>(() => DioConsumer());

  // Features: Product (Category)
  getIt.registerLazySingleton<ProductRemoteDataSource>(
    () => ProductRemoteDataSourceImpl(getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<ProductRepo>(
    () => ProductRepoImpl(
      productRemoteDataSource: getIt<ProductRemoteDataSource>(),
    ),
  );
  getIt.registerLazySingleton<FetchCategoryProductUseCase>(
    () => FetchCategoryProductUseCase(getIt<ProductRepo>()),
  );
  getIt.registerFactory<ProductCategoryCubit>(
    () => ProductCategoryCubit(
      getIt<FetchCategoryProductUseCase>(),
      getIt<DioConsumer>(),
    ),
  );

  // Features: Product Details
  getIt.registerLazySingleton<ProductDetailsRemoteDataSource>(
    () => ProductDetailsRemoteDataSourceImpl(getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<ProductDetailsRepo>(
    () => ProductDetailsRepoImpl(getIt<ProductDetailsRemoteDataSource>()),
  );
  getIt.registerLazySingleton<FetchProductDetailsUseCase>(
    () => FetchProductDetailsUseCase(getIt<ProductDetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchProductAddonsUseCase>(
    () => FetchProductAddonsUseCase(getIt<ProductDetailsRepo>()),
  );
  getIt.registerLazySingleton<FetchCartTotalItemsUseCase>(
    () => FetchCartTotalItemsUseCase(getIt<ProductDetailsRepo>()),
  );
  getIt.registerFactory<ProductDetailsCubit>(
    () => ProductDetailsCubit(
      getIt<FetchProductDetailsUseCase>(),
      getIt<FetchProductAddonsUseCase>(),
      getIt<FetchCartTotalItemsUseCase>(),
      getIt<DioConsumer>(),
    ),
  );

  // Features: Cart
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(getIt<DioConsumer>()),
  );
  getIt.registerLazySingleton<CartRepo>(
    () => CartRepoImpl(getIt<CartRemoteDataSource>()),
  );
  getIt.registerLazySingleton<FetchCartDetailsUseCase>(
    () => FetchCartDetailsUseCase(getIt<CartRepo>()),
  );
  getIt.registerLazySingleton<CartCubit>(
    () => CartCubit(
      getIt<FetchCartTotalItemsUseCase>(),
      getIt<FetchCartDetailsUseCase>(),
      getIt<DioConsumer>(),
    ),
  );
}
