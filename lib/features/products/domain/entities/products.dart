import 'package:equatable/equatable.dart';
import 'package:shopping_app/features/products/domain/entities/rating.dart';

class ProductsEntity extends Equatable {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final RatingEntity? rating;

  const ProductsEntity({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  @override
  List<Object?> get props =>
      [id, title, price, description, category, image, rating];
}