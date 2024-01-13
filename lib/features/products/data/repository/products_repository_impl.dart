import 'package:shopping_app/core/resources/data_state.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  @override
  Future<DataState<List<ProductsModel>>> getAllProducts() {
    throw UnimplementedError();
  }

}