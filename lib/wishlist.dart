import 'package:flutter/material.dart';
import 'main.dart';

class WishlistScreen extends StatefulWidget {
  WishlistScreen({super.key});
  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final _selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 30),
                Align(alignment: Alignment.centerLeft, child: Text('Wishlist', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 16.0, // Horizontal space between items
                    children: [
                      _buildWishlistItem('Tenda A', 'Rp 60.000 / Hari', 'Tenda A Description', 'Tenda A Image'),
                      _buildWishlistItem('Sepatu', 'Rp 30.000 / Hari', 'Sepatu Description', 'Sepatu Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                      _buildWishlistItem('Nama', 'Rp 00.000 / Hari', 'Description', 'Image'),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: mainNavbar(context, _selectedIndex),
    );
  }

  Widget _buildWishlistItem(String title, String price, String description, String imagePath) {
    return Container(
      width: 167, // Fixed width
      height: 228, // Fixed height
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFD26E6E), width: 1), // Light red border
      ),
      child: Column(
        children: [
          // Image placeholder (you can replace it with an actual image)
          Container(
            width: double.infinity,
            height: 140, // Height of the image section
            decoration: BoxDecoration(
              color: Color(0xFFFFE8E8), // Placeholder color for image area
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Icon(Icons.image, color: Colors.white, size: 50),
            ),
          ),
          SizedBox(height: 8),
          // Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(height: 4),
          // Price
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              price,
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
