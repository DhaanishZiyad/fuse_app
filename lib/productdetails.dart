import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final String name;
  final String imagePath;
  final double oldPrice;
  final double currentPrice;

  ProductDetails({required this.name, required this.imagePath, required this.oldPrice, required this.currentPrice});

  @override
  Widget build(BuildContext context) {
    // Detect orientation
    bool isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: isLandscape
            ? Row(
          crossAxisAlignment: CrossAxisAlignment.start, // Align the items to the top
          children: [
            // Image aligned to the left
            Expanded(
              flex: 1, // Ensure the image takes up some width but allows room for the text
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0), // Space between image and details
                child: Image.asset(
                  imagePath,
                  fit: BoxFit.contain, // Image fits within its bounds
                ),
              ),
            ),
            // Text and button aligned to the left, next to the image
            Expanded(
              flex: 1, // Text and buttons take up the remaining width
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start, // Align to the left
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10), // Space between text and prices
                  Text(
                    'LKR. ${oldPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough, // Strike through old price
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'LKR. ${currentPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20), // Space before the button
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ],
        )
            : Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align to the left in portrait mode
          children: [
            // Image at the top in portrait mode
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Image.asset(imagePath),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'LKR. ${oldPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  decoration: TextDecoration.lineThrough, // Strike through old price
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Text(
                'LKR. ${currentPrice.toStringAsFixed(2)}',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    ),
                    child: Text(
                      'Add to Cart',
                      style: TextStyle(color: Colors.white),
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
