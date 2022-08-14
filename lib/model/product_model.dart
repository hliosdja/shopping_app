class ProductModel {
  final int? id;
  final String? title;
  final num? price;
  final String? description;
  final String? category;
  final String? image;
  final dynamic rating;

  ProductModel(
      {this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image,
      this.rating});

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json['id'],
        title: json['title'],
        price: json['price'],
        description: json['description'],
        category: json['category'],
        image: json['image'],
        rating: RatingModel.fromJson(json['rating']),
      );

  @override
  String toString() {
    super.toString();
    return '''
     \nProductModel
     id: $id, title: $title, price: $price, category: $category
     ''';
  }
}

class RatingModel {
  final double? rate;
  final int? count;

  RatingModel({
    this.rate,
    this.count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        rate: json['rate'],
        count: json['count'],
      );
}
