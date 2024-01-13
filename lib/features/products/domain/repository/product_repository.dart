import 'package:shopping_app/features/products/domain/entities/products.dart';
import '../../../../core/resources/request_status.dart';

abstract class ProductsRepository {
  Future<RequestStatus<List<ProductsEntity>>> getAllProducts();
}