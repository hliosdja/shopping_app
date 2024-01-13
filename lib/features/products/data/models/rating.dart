import 'package:shopping_app/features/products/domain/entities/rating.dart';

class RatingModel extends RatingEntity {
  const RatingModel({
    double? rate,
    int? count,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
