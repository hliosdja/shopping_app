import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/products/domain/entities/rating.dart';

class ProductsEntity extends Equatable {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const ProductsEntity({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}