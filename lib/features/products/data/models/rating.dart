import 'dart:developer';

import 'package:shopping_app/features/products/domain/entities/rating.dart';

class RatingModel extends RatingEntity {
  const RatingModel({
    num? rate,
    int? count,
  }) : super(rate: rate, count: count);

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(rate: json['rate'], count: json['count']);
  }
}
