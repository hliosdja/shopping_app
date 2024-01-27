import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/core/usecase/usecase.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class GetProductsUsecase implements UseCase<RequestStatus, void> {
  final ProductsRepository repository;

  GetProductsUsecase(this.repository);

  @override
  Future<RequestStatus<dynamic>> call({void params}) async {
    var response = await repository.getAllProducts();

    if (response.error != null) {
      return RequestFailed(response.error!);
    }
    return RequestSuccess((response.data as List<dynamic>)
        .map((e) => ProductsModel.fromJson(e))
        .toList());
  }
}