import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/utils/custom_widget/product_catalog_card.dart';

import '../utils/custom_widget/wrapper.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.all(8),
              hintText: 'Search product',
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(18))
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // actions: [
        //   BadgeButton(
        //     icon: Icons.shopping_cart,
        //     iconColor: Colors.black,
        //     countBasis: prod.cartList.length.toString(),
        //     visibility: prod.cartList.isEmpty ? false : true,
        //     onPressed: () => Navigator.push(
        //         context, MaterialPageRoute(builder: (_) => CartScreen())),
        //   )
        // ],
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
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 200,
                                childAspectRatio: 1 / 2,
                                mainAxisSpacing: 5,
                                crossAxisSpacing: 5),
                        shrinkWrap: true,
                        itemCount: prod.productList.length,
                        itemBuilder: (_, index) {
                          return ProductCatalogCard(
                            id: prod.productList[index].id!,
                            image: prod.productList[index].image!,
                            title: prod.productList[index].title!,
                            rating: prod.productList[index].rating['rate']!,
                            price: prod.productList[index].price!,
                            description: prod.productList[index].description!,
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
