import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shopping_app/config/network/api_service.dart';
import 'package:shopping_app/features/products/data/datasources/remote/products_api_service.dart';
import 'package:shopping_app/features/products/data/repository/products_repository_impl.dart';
import 'package:shopping_app/features/products/domain/repository/product_repository.dart';
import 'package:shopping_app/features/products/domain/usecases/get_prodcuts_usecase.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_bloc.dart';

final serviceLocator = GetIt.instance;

void initializeModule() {
  serviceLocator.registerSingleton(Dio());
  serviceLocator.registerSingleton(ApiService(serviceLocator()));
  serviceLocator.registerSingleton(ProductsApiService(serviceLocator()));
  serviceLocator.registerSingleton<ProductsRepository>(ProductsRepositoryImpl(serviceLocator()));
  serviceLocator.registerSingleton(GetProductsUsecase(serviceLocator()));
  serviceLocator.registerSingleton(ProductsBloc(serviceLocator()));
}