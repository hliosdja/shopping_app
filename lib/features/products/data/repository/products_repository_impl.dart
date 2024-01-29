import 'dart:io';

import 'package:shopping_app/config/network/failure.dart';
import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/features/products/data/datasources/remote/products_api_service.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService _productsApiService;

  ProductsRepositoryImpl(this._productsApiService);

  @override
  Future<RequestStatus> getAllProducts() async {
    try {
      var response = await _productsApiService.getAllProducts();
      if (response.statusCode == HttpStatus.ok) {
        return RequestSuccess(response.data);
      } else {
        return RequestFailed(
          Failure(status: response.statusCode, message: response.statusMessage),
        );
      }
    } catch (e) {
      return RequestFailed(Failure(message: "Error: $e"));
    }
  }
}
