part of 'product_category_cubit.dart';

@immutable
sealed class ProductCategoryState {}

final class ProductCategoryInitial extends ProductCategoryState {}

final class ProductCategoryLoading extends ProductCategoryState {}

final class ProductCategorySuccess extends ProductCategoryState {
  final List<CategoryProductEntity> categoryProducts;
  ProductCategorySuccess({required this.categoryProducts});
}

final class ProductCategoryError extends ProductCategoryState {
  final ApiErrorModel error;
  ProductCategoryError({required this.error});
}
