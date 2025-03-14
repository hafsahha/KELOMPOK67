import 'package:flutter/material.dart';
import 'home.dart';

class DetailPaketScreen extends StatefulWidget {
  const DetailPaketScreen({super.key});
  @override
  State<DetailPaketScreen> createState() => _DetailPaketScreenState();
}

class _DetailPaketScreenState extends State<DetailPaketScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 35.0), child: Text("Detail Paket", style: TextStyle(fontWeight: FontWeight.bold))),
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
                  Text('Paket Hemat 1', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold)),
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

                  // Isi Paket
                  _buildIsiPaket(),
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
          'Rp310.000 / Hari',
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
      'Nikmati kemudahan berkemah dengan Paket Hemat 1, solusi lengkap untuk kebutuhan perkemahan Anda. Paket ini sudah termasuk berbagai peralatan kemah yang esensial dengan harga terjangkau, cocok untuk keluarga atau kelompok kecil yang ingin merasakan pengalaman berkemah tanpa harus repot membawa banyak peralatan. Paket Hemat 1 memberikan Anda nilai lebih dengan kombinasi alat kemah berkualitas yang pasti mendukung kenyamanan dan keamanan selama berkemah.',
      style: TextStyle(
        color: Colors.black,
        fontSize: 17,
        fontWeight: FontWeight.w400,
      ),
    );
  }

  // Fitur
  Widget _buildFeatures() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Fitur:',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          '• Harga terjangkau untuk sewa peralatan lengkap selama 3 hari.\n• Peralatan berkualitas yang sudah terbukti kehandalannya di kondisi cuaca outdoor.\n• Praktis: Semua peralatan dikemas dalam satu paket sehingga Anda tidak perlu repot mencari peralatan satu per satu.\n• Penghematan biaya: Dapatkan potongan harga lebih hemat dibandingkan menyewa alat secara terpisah.\n• Ketersediaan: Paket ini tersedia untuk sewa mulai dari 3 hari, dengan pilihan perpanjangan sesuai kebutuhan Anda.',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }

  // Isi Paket
  Widget _buildIsiPaket() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Isi Paket:',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
        ),
        const SizedBox(height: 5),
        Text(
          '• Tenda A (kapasitas 4 orang)\n• Sleeping Bag (2 buah)\n• Matras Camping (2 buah)\n• Lampu Tenda (1 buah)\n• Peralatan Masak Portable (termasuk kompor, panci, dan peralatan makan)\n• Kursi Lipat (2 buah)\n• Cooler Box (1 buah)',
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
        _buildReviewCard('Shein', '⭐️⭐️⭐️⭐️⭐️ (5/5)', '"Hemat bgt jadi untung bgt ga nyesel"'),
        _buildReviewCard('Rapla', '⭐️⭐️⭐️⭐️⭐️ (5/5)', '"Worth it"'),
        _buildReviewCard('Aidan', '⭐️⭐️⭐️⭐️ (4/5)', '"Oke tapi sy bete jadi bintang 4 aja"'),
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
