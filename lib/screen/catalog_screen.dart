import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/screen/cart_screen.dart';
import 'package:shopping_app/utils/custom_widget/badge_button.dart';
import 'package:shopping_app/utils/custom_widget/product_catalog_card.dart';

import '../utils/custom_widget/wrapper.dart';

class CatalogScreen extends StatefulWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  State<CatalogScreen> createState() => _CatalogScreenState();
}

class _CatalogScreenState extends State<CatalogScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Catalog'),
        actions: [
          BadgeButton(
            icon: Icons.shopping_cart,
            countBasis: prod.cartList.length.toString(),
            visibility: prod.cartList.isEmpty ? false : true,
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartScreen())),
          )
        ],
      ),
      body: Wrapper(
        initState: () => prod.getData(),
        child: prod.productList.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  Text('Loading...'),
                ],
              ))
            : Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 220,
                                  childAspectRatio: 1 / 2,
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10),
                          shrinkWrap: true,
                          itemCount: prod.productList.length,
                          itemBuilder: (_, index) {
                            return ProductCatalogCard(
                              image: prod.productList[index].image!,
                              title: prod.productList[index].title!,
                              rating: prod.productList[index].rating['rate']!,
                              price: prod.productList[index].price!,
                              addToCartFunction: () {
                                prod.addToCart(
                                  id: prod.productList[index].id,
                                  image: prod.productList[index].image,
                                  title: prod.productList[index].title,
                                  description:
                                      prod.productList[index].description,
                                  category: prod.productList[index].category,
                                  rating: prod.productList[index].rating,
                                  price: prod.productList[index].price,
                                );
                              },
                            );
                          }),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
