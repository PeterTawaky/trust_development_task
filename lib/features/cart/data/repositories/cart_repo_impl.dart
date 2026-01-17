import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_handler.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/cart/data/sources/cart_remote_data_source.dart';
import 'package:trust_development_task/features/cart/domain/entities/cart_details_entity.dart';
import 'package:trust_development_task/features/cart/domain/repositories/cart_repo.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource dataSource;
  CartRepoImpl(this.dataSource);

  @override
  Future<Either<ApiErrorModel, CartDetailsEntity>> fetchCartDetails(
    String guestId,
  ) async {
    try {
      final result = await dataSource.fetchCartDetails(guestId);
      return Right(result);
    } catch (e) {
      return Left(ApiErrorHandler.handle(e));
    }
  }
}
