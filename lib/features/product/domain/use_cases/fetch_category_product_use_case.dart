import 'package:dartz/dartz.dart';
import 'package:trust_development_task/core/networking/api/api_error_model.dart';
import 'package:trust_development_task/features/product/domain/entities/category_product_entity.dart';
import 'package:trust_development_task/features/product/domain/repositories/product_repo.dart';
import 'package:trust_development_task/features/product/domain/use_cases/product_use_case.dart';

class FetchCategoryProductUseCase
    extends ProductUseCase<List<CategoryProductEntity>, NoParam> {
  ProductRepo productRepo;
  FetchCategoryProductUseCase(this.productRepo);
  @override
  Future<Either<ApiErrorModel, List<CategoryProductEntity>>> execute([
    NoParam? param,
  ]) async {
    return await productRepo.fetchCategoryProducts();
  }
}
