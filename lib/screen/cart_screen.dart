import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);
    double titleWidth = MediaQuery.of(context).size.width * 0.6;

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: prod.cartList.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40.0),
                child: Text(
                  'You haven\'t added an item to your cart yet.',
                  style: TextStyle(fontSize: 15),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Items on cart',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: prod.cartList.length,
                        itemBuilder: (_, index) {
                          return Card(
                            elevation: 4,
                            child: Row(
                              children: [
                                Container(
                                  height: 100,
                                  width: 100,
                                  padding: EdgeInsets.all(8),
                                  child: Image.network(
                                    prod.cartList[index].image!,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Container(
                                  width: titleWidth,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        prod.cartList[index].title!,
                                        softWrap: true,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 10),
                                      Text(
                                          '₱ ${prod.cartList[index].price!.toString()}'),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
    );
  }
}
