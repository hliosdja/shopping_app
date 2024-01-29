import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/config/network/api_service.dart';
import 'package:shopping_app/features/products/data/datasources/remote/products_api_service.dart';
import 'package:shopping_app/features/products/data/repository/products_repository_impl.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';
import 'package:shopping_app/features/products/domain/usecases/get_products_usecase.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_bloc.dart';

final sl = GetIt.instance;

void initializeModule() {
  sl.registerSingleton(Dio());
  sl.registerSingleton(ApiService(sl()));
  sl.registerSingleton(ProductsApiService(sl()));
  sl.registerSingleton<ProductsRepository>(ProductsRepositoryImpl(sl()));
  sl.registerSingleton(GetProductsUsecase(sl()));
  sl.registerSingleton(ProductsBloc(sl()));
}