import 'package:flutter/material.dart';
import 'package:fuse_app/cart.dart';
import 'package:fuse_app/home.dart';
import 'package:fuse_app/productdetails.dart';
import 'package:fuse_app/profile.dart';
import 'package:fuse_app/wishlist.dart';

class AppLayout extends StatefulWidget {
  static final String id = "AppLayout";
  final VoidCallback onToggleTheme;
  final int initialIndex; // Define initialIndex

  AppLayout({required this.onToggleTheme, this.initialIndex = 0}); // Default value is 0

  @override
  _AppLayoutState createState() => _AppLayoutState();
}

class _AppLayoutState extends State<AppLayout> {
  int _selectedIndex = 0;
  Map<String, dynamic>? selectedProduct; // Store selected product details

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      selectedProduct = null; // Reset selected product when navigating to other tabs
    });
  }

  // Update the selected product and show product details within the current layout
  void _showProductDetails(Map<String, dynamic> product) {
    setState(() {
      selectedProduct = product;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset('images/logo_black.png', height: 32),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            icon: Icon(Icons.light_mode),
            onPressed: widget.onToggleTheme,
          ),
        ],
      ),
      body: SafeArea(
        child: _buildPageContent(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.teal,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Wishlist',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildPageContent() {
    // Show ProductDetails if a product is selected
    if (selectedProduct != null) {
      return ProductDetails(
        name: selectedProduct!['name'],
        imagePath: selectedProduct!['imagePath'],
        oldPrice: selectedProduct!['oldPrice'],
        currentPrice: selectedProduct!['currentPrice'],
      );
    }

    // Display content based on the current bottom navigation index
    switch (_selectedIndex) {
      case 0:
        return Home(onProductSelected: _showProductDetails);
      case 1:
        return Wishlist(onProductSelected: _showProductDetails);
      case 2:
        return Cart();
      case 3:
        return Profile();
      default:
        return Home(onProductSelected: _showProductDetails);
    }
  }
}
