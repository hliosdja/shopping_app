import 'package:dio/dio.dart';
import 'package:shopping_app/core/constants/api_url.dart';

class ApiService {
  final Dio dio;

  ApiService(this.dio);

  Future<Response> get(String endpoint, {dynamic parameters}) async {
    return await dio.get("$baseURL$endpoint", queryParameters: parameters);
  }

  Future<Response> post(String endpoint, dynamic parameters) async {
    return await dio.post("$baseURL$endpoint", queryParameters: parameters);
  }
}