import 'package:flutter/material.dart';
import 'home.dart';

class DetailItemScreen extends StatefulWidget {
  const DetailItemScreen({super.key});
  @override
  State<DetailItemScreen> createState() => _DetailItemScreenState();
}

class _DetailItemScreenState extends State<DetailItemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 35.0), child: Text("Detail Item", style: TextStyle(fontWeight: FontWeight.bold))),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(top: 25),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen(),)); },
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Tenda A', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        _buildProductImage(),
                        _buildProductImage(),
                        _buildProductImage(),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Price, Rating, and Heart Icon
                  _buildPriceRating(),
                  const SizedBox(height: 20),

                  // Availability Text
                  _buildAvailability(),
                  const SizedBox(height: 20),

                  // Product Description
                  _buildProductDescription(),
                  const SizedBox(height: 20),

                  // Features List
                  _buildFeatures(),
                  const SizedBox(height: 20),

                  // Review Section
                  _buildReviewSection(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              color: Color(0xFFF4F4F4),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildFooterButton(Icons.chat, ''),
                  _buildFooterButton(Icons.shopping_cart, ''),
                  _buildFooterButton(Icons.check, 'Beli Sekarang'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Single Product Image
  Widget _buildProductImage() {
    return Container(
      width: 300,
      height: 344,
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: Color(0xFFFFE8E8),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Color(0xFFD36E6E), width: 1),
      ),
    );
  }

  // Price, Rating, and Heart Icon (All in One Row)
  Widget _buildPriceRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Price
        Text(
          'Rp60.000 / Hari',
          style: TextStyle(
            color: Colors.black,
            fontSize: 25,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5),

        // Rating and Heart Icon in the same row
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Spread the elements apart
          children: [
            _buildRatingStars(),
            IconButton(
              icon: Icon(Icons.favorite_border),
              onPressed: () {
                // Wishlist action
              },
              color: Colors.red,
            ),
          ],
        ),
      ],
    );
  }

  // Rating Stars
  Widget _buildRatingStars() {
    return Row(
      children: List.generate(5, (index) {
        return Icon(
          index < 4 ? Icons.star : Icons.star_border,
          color: Colors.amber,
          size: 24,
        );
      }),
    );
  }

  // Availability Text (Below Price and Rating)
  Widget _buildAvailability() {
    return Text(
      '5 tersedia',
      style: TextStyle(
        color: Color(0xFF888888),
        fontSize: 16,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Product Description
  Widget _buildProductDescription() {
    return Text(
      'Tenda A adalah tenda berkualitas tinggi yang dirancang untuk memberikan kenyamanan maksimal selama berkemah...',
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Features List
  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fitur Utama:',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          '• Kapasitas: 4 orang\n• Bahan: Polyester tahan air (waterproof 2000mm)\n• Lapisan UV untuk perlindungan matahari\n• Mudah dipasang dengan desain pop-up\n• Jendela ventilasi untuk sirkulasi udara yang optimal\n• Berat ringan dan mudah dibawa\n• Tenda dilengkapi dengan tas penyimpanan praktis',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  // Review Section
  Widget _buildReviewSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Review Produk', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        _buildReviewCard('Karina', '⭐️⭐️⭐️⭐️⭐️ (5/5)', '"Tenda A sangat nyaman dan mudah digunakan"'),
        _buildReviewCard('Denis', '⭐️⭐️⭐️⭐️⭐️ (5/5)', '"Bagus, sesuai deskripsi"'),
        _buildReviewCard('Jin Woo', '⭐️⭐️⭐️⭐️ (4/5)', '"Tenda A cukup bagus dan mudah dipasang"'),
      ],
    );
  }

  Widget _buildReviewCard(String name, String rating, String review) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 51, height: 23,
              child: Text(name, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            SizedBox(
              width: 310, height: 26,
              child: Text(rating, style: TextStyle(fontSize: 17)),
            ),
            SizedBox(
              width: 310,
              child: Text(review, style: TextStyle(fontSize: 17)),
            ),
          ],
        ),
      ),
    );
  }

  // Footer Button Widget for Chat, Cart, Checkout
  Widget _buildFooterButton(IconData icon, String label) {
    return ElevatedButton(
        onPressed: () { },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFFF5B3B3),
          padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          children: [
              Icon(icon, color: Colors.black, size: 20),
              if (label.isNotEmpty) ...[
                SizedBox(width: 8),
                Text(label, style: TextStyle(color: Colors.black, fontSize: 16))
              ],
          ],
        ),
    );
  }
}
