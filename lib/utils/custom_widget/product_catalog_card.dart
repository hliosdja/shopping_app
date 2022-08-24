import 'package:flutter/material.dart';

class ProductCatalogCard extends StatelessWidget {
  final String image;
  final String title;
  final num rating;
  final num price;
  final VoidCallback addToCartFunction;
  const ProductCatalogCard(
      {Key? key,
      required this.image,
      required this.title,
      required this.rating,
      required this.addToCartFunction,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildRatingStars(num rating) {
      List<Widget> stars = [];
      for (var i = 0; i < int.parse(rating.toString()[0]); i++) {
        stars.add(Icon(
          Icons.star,
          color: Colors.black,
          size: 15,
        ));
      }
      if (rating.toString().length > 2) {
        if (int.parse(rating.toString()[2]) > 5) {
          stars.add(Icon(
            Icons.star_half,
            size: 15,
          ));
        }
      }
      return stars;
    }

    return Card(
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
                image,
                fit: BoxFit.contain,
                errorBuilder: (_, exception, stacktrace) =>
                    Image.asset('asset/shopping_bag.png'),
              ),
            ),
            SizedBox(height: 10),
            Text(
              title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 10),
            Spacer(),
            Row(
              children: [
                Text('Ratings: '),
                Row(
                  children: _buildRatingStars(rating),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '₱ ${price.toString()}',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                IconButton(
                    onPressed: addToCartFunction,
                    icon: Icon(Icons.add_shopping_cart))
              ],
            )
          ],
        ),
      ),
    );
  }
}
