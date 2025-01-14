import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String imageURL;

  const ProductCard({
  super.key,
  required this.title,
    required this.price,
    required this.imageURL,


  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(216, 240, 253, 1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium,),
          const SizedBox(height: 5,), Text('\$$price'),
          Center(
            child: Image(image:
            AssetImage(imageURL),),
          ),

        ],
      ),

    );
  }
}
