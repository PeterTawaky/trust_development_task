part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsSuccess extends ProductDetailsState {
  final ProductDetailsEntity productDetails;
  final List<ProductAddonEntity> productAddons;
  final int totalItems;
  ProductDetailsSuccess({
    required this.productDetails,
    required this.productAddons,
    required this.totalItems,
  });
}

final class ProductDetailsError extends ProductDetailsState {
  final ApiErrorModel error;
  ProductDetailsError({required this.error});
}
