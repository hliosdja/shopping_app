import 'package:dartz/dartz.dart';

import '../../../../core/resources/request_status.dart';

abstract class ProductsRepository {
  Future<Either<RequestFailed, RequestSuccess>> getAllProducts();
}