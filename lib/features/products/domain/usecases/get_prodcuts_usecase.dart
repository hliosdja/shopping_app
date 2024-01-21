import 'package:dartz/dartz.dart';
import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class GetProductsUsecase implements UseCase<Either<RequestFailed, RequestSuccess>, void> {
  final ProductsRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<Either<RequestFailed, RequestSuccess>> call({void params}) {
    return repository.getAllProducts();
  }
}