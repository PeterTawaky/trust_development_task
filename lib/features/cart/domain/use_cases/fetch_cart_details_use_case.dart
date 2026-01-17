import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';
import 'package:trust_development_task/features/cart/domain/repositories/cart_repo.dart';

class FetchCartDetailsUseCase {
  final CartRepo repo;
  FetchCartDetailsUseCase(this.repo);

  Future<Either<ApiErrorModel, CartDetailsEntity>> execute(String guestId) {
    return repo.fetchCartDetails(guestId);
  }
}
