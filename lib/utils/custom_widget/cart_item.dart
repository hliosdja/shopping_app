import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  CartItem(
      {Key? key, required this.image, required this.title, required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double titleWidth = MediaQuery.of(context).size.width * 0.6;

    return Card(
      elevation: 4,
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
          SizedBox(
            width: titleWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  softWrap: true,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(price),
              ],
            ),
          )
        ],
      ),
    );
  }
}
