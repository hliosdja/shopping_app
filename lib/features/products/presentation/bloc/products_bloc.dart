import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_event.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_state.dart';

import '../../domain/usecases/get_prodcuts_usecase.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase _getProductsUsecase;

  ProductsBloc(this._getProductsUsecase) : super(ProductsGetInitial()) {
    on<ProductsGetEvent>(
      (event, emit) async {
        List<ProductsModel> list = <ProductsModel>[];

        final result = await _getProductsUsecase.repository.getAllProducts();

        result.fold(
          (l) => ProductsGetFailed(l.error?.message),
          (r) {
            for (var element in r.data) {
              log("$element");
              list.add(ProductsModel.fromJson(element));
            }
            log("$list");
            ProductsGetSuccess(list);
          }
        );
      },
    );
  }
}
