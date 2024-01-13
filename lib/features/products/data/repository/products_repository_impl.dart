import 'dart:io';

import 'package:dio/dio.dart';
import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/features/products/data/datasources/remote/products_api_service.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService _productsApiService;

  ProductsRepositoryImpl(this._productsApiService);

  @override
  Future<RequestStatus<List<ProductsModel>>> getAllProducts() async  {
    try {
      final response = await _productsApiService.getAllProducts();
      if(response.statusCode == HttpStatus.ok) {
        return RequestSuccess(response.data);
      } else {
        return RequestFailed(
            DioException(
                response: response,
                type: DioExceptionType.unknown,
                requestOptions: response.requestOptions
            )
        );
      }
    } on DioException catch(e) {
      return RequestFailed(e);
    }
  }
}