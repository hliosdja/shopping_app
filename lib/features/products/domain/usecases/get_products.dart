import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/features/products/domain/entities/products.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class GetProducts implements UseCase<RequestStatus<List<ProductsEntity>>, void> {
  final ProductsRepository repository;

  GetProducts(this.repository);

  @override
  Future<RequestStatus<List<ProductsEntity>>> call({void params}) {
    return repository.getAllProducts();
  }
}