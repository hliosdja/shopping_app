import 'package:flutter/material.dart';

import '../model/product_model.dart';
import '../utils/network_helper.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> _productList = [];
  List<ProductModel> get productList => _productList;
  set productList(List<ProductModel> newList) {
    _productList = newList;
    notifyListeners();
  }

  List<ProductModel> _cartList = [];
  List<ProductModel> get cartList => _cartList;
  set cartList(List<ProductModel> newList) {
    _cartList = newList;
    notifyListeners();
  }

  void getData() async {
    var fetchedProduct =
        await NetworkHelper.fetch(url: 'https://fakestoreapi.com/products');
    for (var result in fetchedProduct) {
      _productList.add(
        ProductModel(
            id: result['id'],
            title: result['title'],
            price: result['price'],
            description: result['description'],
            category: result['category'],
            image: result['image'],
            rating: result['rating']),
      );
    }
    notifyListeners();
    print('product list: ${_productList.length}');
    print('products: $_productList');
  }

  void addToCart(
      {int? id,
      String? title,
      dynamic price,
      String? description,
      String? category,
      String? image,
      dynamic rating}) {
    _cartList.add(ProductModel(
        id: id,
        title: title,
        price: price,
        description: description,
        category: category,
        image: image,
        rating: rating));
    notifyListeners();
  }
}
