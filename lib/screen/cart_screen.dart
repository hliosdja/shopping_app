import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/product_provider.dart';
import 'package:shopping_app/utils/custom_widget/cart_item.dart';
import 'package:shopping_app/utils/custom_widget/round_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text('Cart'),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          Center(
            child: Text(
              'Your Orders',
              style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 30,
          )
        ],
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
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      itemCount: prod.cartList.length,
                      itemBuilder: (_, index) {
                        return Dismissible(
                          key: Key(prod.cartList[index].id!.toString()),
                          child: CartItem(
                              image: prod.cartList[index].image!,
                              title: prod.cartList[index].title!,
                              price: prod.cartList[index].price!.toString()),
                          onDismissed: (direction) {
                            setState(() {
                              prod.cartList.removeAt(index);
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Item removed on cart')));
                          },
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) =>
                          SizedBox(height: 8),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Total: ',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$ 100.99',
                          style: TextStyle(fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  RoundButton(height: 60, label: 'Checkout', onPressed: () {}),
                ],
              ),
            ),
    );
  }
}
