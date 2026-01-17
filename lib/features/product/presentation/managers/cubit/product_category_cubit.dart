import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trust_development_task/core/networking/api/api_constants.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/core/networking/api/dio_consumer.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';
import 'package:trust_development_task/features/product/domain/use_cases/fetch_category_product_use_case.dart';

part 'product_category_state.dart';

class ProductCategoryCubit extends Cubit<ProductCategoryState> {
  //should be injected
  final FetchCategoryProductUseCase fetchCategoryProductUseCase;
  ProductCategoryCubit(this.fetchCategoryProductUseCase)
    : super(ProductCategoryInitial());

  Future<void> fetchCategoryProducts() async {
    emit(ProductCategoryLoading());
    var result = await fetchCategoryProductUseCase.execute();
    result.fold(
      (failure) {
        emit(ProductCategoryError(error: failure));
      },
      (products) {
        emit(ProductCategorySuccess(categoryProducts: products));
      },
    );
  }

  Future<void> addToCart({
    required String productId,
    int quantity = 1,
    List addons = const [],
    String guestID = "guest_696a48a32130f",
  }) async {
    var response = await DioConsumer().post(
      ApiConstants.addToCart,
      data: {
        "guest_id": guestID,
        "items": [
          {"product_id": productId, "quantity": quantity, "addons": addons},
        ],
      },
    );
  }
}
