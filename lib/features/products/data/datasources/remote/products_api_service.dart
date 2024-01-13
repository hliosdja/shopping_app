import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants.dart';

abstract class ProductsApiService {
  final dio = Dio();

  Future<Response> getAllProducts() async {
    return await dio.get('$baseURL/products');
  }
}