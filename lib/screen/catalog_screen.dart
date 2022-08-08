import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';

import '../utils/custom_widget/wrapper.dart';
import 'cart_screen.dart';

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
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => CartScreen()));
                },
                icon: Icon(Icons.shopping_cart),
              ),
              Visibility(
                visible: prod.cartList.isEmpty ? false : true,
                child: Positioned.directional(
                  top: 5,
                  textDirection: TextDirection.ltr,
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Center(
                      child: Text(
                        prod.cartList.length.toString(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
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
                    // Text(
                    //   'Products',
                    //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    // ),
                    SizedBox(height: 10),
                    Expanded(
                      child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                maxCrossAxisExtent: 220,
                                childAspectRatio: 1 / 2.25,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        shrinkWrap: true,
                        itemCount: prod.productList.length,
                        itemBuilder: (_, index) => Card(
                          elevation: 3,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.center,
                                  width: 200,
                                  height: 200,
                                  child: Image.network(
                                    prod.productList[index].image!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(prod.productList[index].title!),
                                SizedBox(height: 10),
                                Spacer(),
                                Text(
                                    'Rating: ${prod.productList[index].rating}'),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '₱ ${prod.productList[index].price!}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          prod.addToCart(
                                              id: prod.productList[index].id,
                                              title:
                                                  prod.productList[index].title,
                                              price:
                                                  prod.productList[index].price,
                                              description: prod
                                                  .productList[index]
                                                  .description,
                                              image:
                                                  prod.productList[index].image,
                                              rating: prod
                                                  .productList[index].rating);
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text('Item added')));
                                        },
                                        icon: Icon(Icons.add_shopping_cart))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => prod.getData(),
      //   child: Icon(Icons.search),
      // ),
    );
  }
}
