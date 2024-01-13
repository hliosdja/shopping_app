import 'package:shopping_app/features/products/domain/entities/products.dart';
import '../../../../core/resources/data_state.dart';

abstract class ProductsRepository {
  Future<DataState<List<ProductsEntity>>> getAllProducts();
}