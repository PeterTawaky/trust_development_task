import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product_details/domain/entities/cart_entity.dart';
import 'package:trust_development_task/features/product_details/domain/repositories/product_details_repo.dart';

class FetchCartTotalItemsUseCase {
  final ProductDetailsRepo productDetailsRepo;

  FetchCartTotalItemsUseCase(this.productDetailsRepo);

  Future<Either<ApiErrorModel, CartEntity>> execute(String guestId) async {
    return await productDetailsRepo.fetchCartTotalItems(guestId: guestId);
  }
}
