import 'package:dio/dio.dart';
import 'package:shopping_app/config/network/api_service.dart';

class ProductsApiService {
  final ApiService _apiService;

  ProductsApiService(this._apiService);

  Future<Response> getAllProducts() async {
    return await _apiService.get('products');
  }
}