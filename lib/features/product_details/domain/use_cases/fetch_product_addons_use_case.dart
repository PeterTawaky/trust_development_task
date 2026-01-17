import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_addon_entity.dart';
import 'package:trust_development_task/features/product_details/domain/repositories/product_details_repo.dart';

class FetchProductAddonsUseCase {
  final ProductDetailsRepo productDetailsRepo;

  FetchProductAddonsUseCase(this.productDetailsRepo);

  Future<Either<ApiErrorModel, List<ProductAddonEntity>>> execute(
    String productId,
  ) async {
    return await productDetailsRepo.fetchProductAddons(productId: productId);
  }
}
