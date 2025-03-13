import 'package:flutter/material.dart';

class WishlistPage extends StatelessWidget {
  const WishlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Centered wishlist items list
          Expanded(
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Wrap(
                    spacing: 16.0, // Horizontal space between items
                    runSpacing: 16.0, // Vertical space between items
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
      bottomNavigationBar: buildBottomNavigationBar(),
    );
  }

  Widget _buildWishlistItem(String title, String price, String description, String imagePath) {
    return Container(
      width: 167, // Fixed width
      height: 228, // Fixed height
      margin: const EdgeInsets.only(bottom: 20),
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
          const SizedBox(height: 8),
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Price
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
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

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Transaksi'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
    );
  }
}
