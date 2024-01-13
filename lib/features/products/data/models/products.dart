import 'package:shopping_app/features/products/domain/entities/products.dart';
import '../../../../model/product_model.dart';

class ProductsModel extends ProductsEntity {
  const ProductsModel({
    int? id,
    String? title,
    double? price,
    String? description,
    String? category,
    String? image,
    RatingModel? rating,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) {
    return ProductsModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating: RatingModel.fromJson(json['rating']),
    );
  }
}
