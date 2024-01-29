import 'package:shopping_app/features/products/data/models/rating.dart';
import 'package:shopping_app/features/products/domain/entities/products.dart';

class ProductsModel extends ProductsEntity {
  const ProductsModel({
    int? id,
    String? title,
    num? price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating,
  }) : super(
          id: id,
          title: title,
          price: price,
          description: description,
          category: category,
          image: image,
          rating: rating,
        );

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      price: json['price'] ?? 0,
      description: json['description'] ?? "",
      category: json['category'] ?? "",
      image: json['image'] ?? "",
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}
