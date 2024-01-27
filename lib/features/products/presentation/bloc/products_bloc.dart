import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/resources/request_status.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_event.dart';
import 'package:shopping_app/features/products/presentation/bloc/products_state.dart';

import '../../domain/usecases/get_products_usecase.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final GetProductsUsecase _getProductsUsecase;

  ProductsBloc(this._getProductsUsecase) : super(ProductsGetInitial()) {
    on<ProductsGetEvent>((event, emit) async {
      emit(ProductsGetLoading());

      final result = await _getProductsUsecase.call();
      if (result is RequestSuccess) {
        emit(ProductsGetSuccess(result.data));
      } else {
        emit(ProductsGetFailed(result.error?.message));
      }
    });
  }
}