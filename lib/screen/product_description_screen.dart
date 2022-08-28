import 'package:flutter/material.dart';

class ProductDescriptionScreen extends StatelessWidget {
  final int id;
  final String image;
  final String title;
  final num price;
  final String description;
  final num rating;
  const ProductDescriptionScreen(
      {Key? key,
      required this.id,
      required this.image,
      required this.title,
      required this.price,
      required this.description,
      required this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildRatingStars(num rating, double size) {
      List<Widget> stars = [];
      int wholeStars = int.parse(rating.toString()[0]);
      for (var i = 0; i < wholeStars; i++) {
        stars.add(Icon(
          Icons.star,
          color: Colors.black,
          size: size,
        ));
      }
      if (rating.toString().length > 2) {
        if (int.parse(rating.toString()[2]) > 5) {
          stars.add(Icon(
            Icons.star_half,
            size: size,
          ));
        }
      }
      return stars;
    }

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 350,
              child: Image.network(
                image,
                fit: BoxFit.contain,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25)),
                  SizedBox(height: 10),
                  Text(
                    '₱ ${price.toString()}',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Divider(
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Row(
                        children: _buildRatingStars(rating, 20),
                      ),
                      SizedBox(width: 15),
                      Text(
                        rating.toString(),
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Product Description',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16)),
                      SizedBox(height: 20),
                      Text(description)
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
