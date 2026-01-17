import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';
import 'package:trust_development_task/features/cart/domain/use_cases/fetch_cart_details_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/use_cases/fetch_cart_total_items_use_case.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final FetchCartTotalItemsUseCase fetchCartTotalItemsUseCase;
  final FetchCartDetailsUseCase fetchCartDetailsUseCase;
  final DioConsumer dioConsumer;

  CartCubit(
    this.fetchCartTotalItemsUseCase,
    this.fetchCartDetailsUseCase,
    this.dioConsumer,
  ) : super(CartInitial());

  Future<void> fetchCartTotalItems({
    String guestId = "guest_696a48a32130f",
  }) async {
    final result = await fetchCartTotalItemsUseCase.execute(guestId);
    result.fold((failure) => emit(CartError()), (cart) {
      if (state is CartSuccess) {
        final current = state as CartSuccess;
        emit(
          CartSuccess(
            totalItems: cart.totalItems,
            cartDetails: current.cartDetails,
          ),
        );
      } else {
        emit(CartSuccess(totalItems: cart.totalItems));
      }
    });
  }

  Future<void> fetchCartDetails({
    String guestId = "guest_696a48a32130f",
    bool showLoading = true,
  }) async {
    if (showLoading) emit(CartLoading());
    final result = await fetchCartDetailsUseCase.execute(guestId);
    result.fold(
      (failure) => emit(CartError()),
      (cartDetails) => emit(
        CartSuccess(
          totalItems: cartDetails.totalItems,
          cartDetails: cartDetails,
        ),
      ),
    );
  }

  Future<void> addToCart({
    required String productId,
    required int quantity,
    required List addons,
    String guestId = "guest_696a48a32130f",
  }) async {
    try {
      await dioConsumer.post(
        'guestcart/v1/cart',
        data: {
          "guest_id": guestId,
          "items": [
            {"product_id": productId, "quantity": quantity, "addons": addons},
          ],
        },
      );
      await fetchCartDetails(guestId: guestId, showLoading: false);
    } catch (e) {
      await fetchCartDetails(guestId: guestId, showLoading: false);
    }
  }

  void updateCartCount(int count) {
    if (state is CartSuccess) {
      final current = state as CartSuccess;
      emit(CartSuccess(totalItems: count, cartDetails: current.cartDetails));
    } else {
      emit(CartSuccess(totalItems: count));
    }
  }
}
