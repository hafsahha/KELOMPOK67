import 'package:flutter/material.dart';

class RincianItem extends StatelessWidget {
  const RincianItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rincian Item"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Product Title
                  _buildProductTitle(),
                  const SizedBox(height: 10),

                  // Product Image Row (Scrollable)
                  _buildProductImageRow(),
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

                  // See All Reviews Button
                  _buildSeeAllReviews(),
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
                  _buildFooterButton(Icons.chat, 'Chat'),
                  _buildFooterButton(Icons.shopping_cart, 'Add to Cart'),
                  _buildFooterButton(Icons.check, 'Beli Sekarang'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Product Title
  Widget _buildProductTitle() {
    return Text(
      'Tenda A',
      style: TextStyle(
        color: Colors.black,
        fontSize: 34,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
      ),
    );
  }

  // Scrollable Product Images Row
  Widget _buildProductImageRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildProductImage(),
          _buildProductImage(),
          _buildProductImage(),
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
        _buildReviewCard('Iduy', '⭐️⭐️⭐️⭐️⭐️ (5/5)', '"Bagus, sesuai deskripsi"'),
        _buildReviewCard('Jin Woo', '⭐️⭐️⭐️⭐️ (4/5)', '"Tenda A cukup bagus dan mudah dipasang"'),
      ],
    );
  }

  // Review Card Widget
  Widget _buildReviewCard(String name, String rating, String review) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        title: Text(name),
        subtitle: Text(rating),
        trailing: Text(review),
      ),
    );
  }

  // See All Reviews Button
  Widget _buildSeeAllReviews() {
    return Text(
      'Lihat semua',
      style: TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Footer Button Widget for Chat, Cart, Checkout
  Widget _buildFooterButton(IconData icon, String label) {
    return ElevatedButton(
        onPressed: () {
        // Implement action for button
        },
        style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFFF5B3B3), // Pink color for button
        padding: EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
        ),
        ),
        child: Row(
        children: [
            Icon(
            icon,
            color: Colors.black,
            size: 20,
            ),
            SizedBox(width: 8),
            Text(
            label,
            style: TextStyle(color: Colors.black, fontSize: 16),
            ),
        ],
        ),
    );
    }
}
