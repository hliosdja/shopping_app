import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:shopping_app/features/products/data/models/products.dart';
import 'package:shopping_app/features/products/presentation/widgets/catalog_product_card.dart';

class CatalogGridView extends StatelessWidget {
  final List<ProductsModel> productList;

  const CatalogGridView({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {

    log("in catalog view: ${productList.length}");

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 2,
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5),
              shrinkWrap: true,
              itemCount: productList.length,
              itemBuilder: (_, index) {
                final item = productList[index];

                return CatalogProductCard(
                  id: item.id!,
                  image: item.image!,
                  title: item.title!,
                  rating: item.rating!.rate!,
                  price: item.price!,
                  description: item.description!,
                  addToCartFunction: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
