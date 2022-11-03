import 'package:flutter/material.dart';
import 'package:shopping_app/utils/custom_widget/quantity_widget.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  const CartItem(
      {Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double titleWidth = MediaQuery.of(context).size.width * 0.5;

    return Card(
      color: Colors.grey[200],
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(18))
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              padding: EdgeInsets.all(8),
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(width: 10),
            SizedBox(
              width: titleWidth,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    softWrap: true,
                    style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$ $price', style: TextStyle(fontSize: 17)),
                      QuantityWidget()
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
