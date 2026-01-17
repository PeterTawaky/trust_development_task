import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_cart_total_items_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_product_addons_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_product_details_use_case.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  final FetchProductDetailsUseCase fetchProductDetailsUseCase;
  final FetchProductAddonsUseCase fetchProductAddonsUseCase;
  final FetchCartTotalItemsUseCase fetchCartTotalItemsUseCase;
  final DioConsumer dioConsumer;

  ProductDetailsCubit(
    this.fetchProductDetailsUseCase,
    this.fetchProductAddonsUseCase,
    this.fetchCartTotalItemsUseCase,
    this.dioConsumer,
  ) : super(ProductDetailsInitial());

  Future<void> fetchProductDetails(
    String productId, {
    String guestId = "guest_696a48a32130f",
  }) async {
    emit(ProductDetailsLoading());

    final detailsResult = await fetchProductDetailsUseCase.execute(productId);
    final addonsResult = await fetchProductAddonsUseCase.execute(productId);
    final cartResult = await fetchCartTotalItemsUseCase.execute(guestId);

    detailsResult.fold((failure) => emit(ProductDetailsError(error: failure)), (
      productDetails,
    ) {
      addonsResult.fold(
        (failure) => emit(ProductDetailsError(error: failure)),
        (productAddons) {
          cartResult.fold(
            (failure) => emit(ProductDetailsError(error: failure)),
            (cart) => emit(
              ProductDetailsSuccess(
                productDetails: productDetails,
                productAddons: productAddons,
                totalItems: cart.totalItems,
              ),
            ),
          );
        },
      );
    });
  }

  Future<void> addToCart({
    required String productId,
    int quantity = 1,
    List addons = const [],
    String guestID = "guest_696a48a32130f",
  }) async {
    await dioConsumer.post(
      ApiConstants.addToCart,
      data: {
        "guest_id": guestID,
        "items": [
          {"product_id": productId, "quantity": quantity, "addons": addons},
        ],
      },
    );

    // Refresh cart total items after adding to cart
    final cartResult = await fetchCartTotalItemsUseCase.execute(guestID);
    cartResult.fold(
      (failure) => null, // Handle error if needed
      (cart) {
        if (state is ProductDetailsSuccess) {
          final currentState = state as ProductDetailsSuccess;
          emit(
            ProductDetailsSuccess(
              productDetails: currentState.productDetails,
              productAddons: currentState.productAddons,
              totalItems: cart.totalItems,
            ),
          );
        }
      },
    );
  }
}
