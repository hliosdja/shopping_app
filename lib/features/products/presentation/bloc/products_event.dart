import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {}

class ProductsGetEvent extends ProductsEvent {

  @override
  List<Object?> get props => [];
}