import '../../../../core/resources/request_status.dart';

abstract class ProductsRepository {
  Future<RequestStatus> getAllProducts();
}