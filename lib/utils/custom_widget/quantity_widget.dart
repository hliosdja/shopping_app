import 'package:flutter/material.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({Key? key}) : super(key: key);

  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  int quantity = 1;

  incrementItem() {
    setState(() {
      quantity += 1;
    });
  }

  decrementItem() {
    if (quantity < 1) return quantity = 0;
    if (quantity > 0)
      return setState(() {
        quantity -= 1;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
              width: 25,
              child: TextButton(onPressed: decrementItem, child: Text('-', style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),))),
          SizedBox(
              width: 25,
              child: Text(
                '$quantity',
                textAlign: TextAlign.center,
              )),
          SizedBox(
              width: 25,
              child: TextButton(onPressed: incrementItem, child: Text('+', style: TextStyle(fontSize: 15),))),
        ],
      ),
    );
  }
}
