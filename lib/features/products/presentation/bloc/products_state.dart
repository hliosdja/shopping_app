import 'package:equatable/equatable.dart';

import '../../data/models/products.dart';

abstract class ProductsState extends Equatable {}

class ProductsGetLoading extends ProductsState {
  @override
  List<Object?> get props => [];
}

class ProductsGetSuccess extends ProductsState {
  final List<ProductsModel> productsList;

  ProductsGetSuccess(this.productsList);

  @override
  List<Object?> get props => [productsList];
}

class ProductsGetFailed extends ProductsState {
  final String? message;

  ProductsGetFailed(this.message);

  @override
  List<Object?> get props => [message];
}