import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product/domain/use_cases/product_use_case.dart';
import 'package:trust_development_task/features/product_details/domain/entities/product_details_entity.dart';
import 'package:trust_development_task/features/product_details/domain/repositories/product_details_repo.dart';

class FetchProductDetailsUseCase
    extends ProductUseCase<ProductDetailsEntity, String> {
  final ProductDetailsRepo productDetailsRepo;

  FetchProductDetailsUseCase(this.productDetailsRepo);

  @override
  Future<Either<ApiErrorModel, ProductDetailsEntity>> execute([
    String? param,
  ]) async {
    return await productDetailsRepo.fetchProductDetails(productId: param!);
  }
}
