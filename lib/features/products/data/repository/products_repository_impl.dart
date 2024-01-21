import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:shopping_app/config/network/failure.dart';
import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/features/products/data/datasources/remote/products_api_service.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';

class ProductsRepositoryImpl implements ProductsRepository {
  final ProductsApiService _productsApiService;

  ProductsRepositoryImpl(this._productsApiService);

  @override
  Future<Either<RequestFailed, RequestSuccess>> getAllProducts() async {
    List productList = <ProductsModel>[];

    try {
      var response = await _productsApiService.getAllProducts();
      if (response.statusCode == HttpStatus.ok) {
        return Right(RequestSuccess(response.data));
      } else {
        return Left(
          RequestFailed(
            Failure(
                status: response.statusCode, message: response.statusMessage),
          ),
        );
      }
    } catch (e) {
      return Left(RequestFailed(Failure(message: "Error: $e")));
    }
  }
}
