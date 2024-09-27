import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String name;
  final String imagePath;
  final double oldPrice;
  final double currentPrice;

  ProductCard({
    required this.name,
    required this.imagePath,
    required this.oldPrice,
    required this.currentPrice,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: 170,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.grey[850] : Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: isDarkMode
            ? [] // No shadow in dark mode
            : [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image with aspect ratio
            AspectRatio(
              aspectRatio: 1 / 1, // Ensures the image maintains a 1:1 ratio
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            // Product Name and Prices in a Column with even vertical spacing
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Even vertical spacing
                crossAxisAlignment: CrossAxisAlignment.start, // Align text to the left
                children: [
                  // Product Name
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Old Price with strikethrough
                  Text(
                    'LKR. ${oldPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),

                  // Current Price
                  Text(
                    'LKR. ${currentPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal,
                    ),
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
