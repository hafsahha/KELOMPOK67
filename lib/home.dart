import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                homeSearchbar(context),
                SizedBox(height: 20),
                homeCategoryFilters(context),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        homePackage('Paket Hemat 1', 'images/paket.png'),
                        homePackage('Paket Hemat 2', 'images/paket.png'),
                        homePackage('Paket Promo A', 'images/paket.png'),
                        homePackage('Paket Promo B', 'images/paket.png'),
                        homePackage('Paket Lengkap', 'images/paket.png'),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  homeProduct('Tenda A', 60000, 5, 'Tenda terbuat dari bahan XYZ yang tahan kecepatan angin.', 'images/tenda.png'),
                  homeProduct('Sepatu Gunung', 30000, 10, 'Sepatu waterproof, merk XYZ, semua ukuran.', 'images/sepatu.png'),
                  homeProduct('Item 3', 1000, 0, 'Deskripsi item.', 'images/question.png'),
                  homeProduct('Item 4', 2000, 0, 'Deskripsi item.', 'images/question.png'),
                  homeProduct('Item 5', 3000, 0, 'Deskripsi item.', 'images/question.png'),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: mainNavbar(context, _selectedIndex),
    );
  }

  Widget homeSearchbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
          color: Color(0xFFD9D9D9),
          borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
          decoration: InputDecoration(
            hintText: 'Cari item',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(Icons.search),
          ),
              ),
            ),
          ),
          SizedBox(width: 10),
          GestureDetector(
            onTap: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfileScreen())); },
            child: Icon(Icons.account_circle_outlined, size: 50),
          ),
        ],
      ),
    );
  }

  Widget homeCategoryFilters(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Container(
            width: 100, alignment: Alignment.center,
            decoration: BoxDecoration(border: Border(right: BorderSide(color: Colors.grey))),
            child: Center(child: Text('Semua')),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  homeFilters('Ransel'),
                  homeFilters('Alat Masak'),
                  homeFilters('Jaket & Sepatu'),
                  homeFilters('Tenda'),
                  homeFilters('Penerangan'),
                  homeFilters('Alat Tidur'),
                  homeFilters('Lainnya'),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }

  Widget homeFilters(String name) {
    return Container(
      width: 100,
      alignment: Alignment.center,
      decoration: BoxDecoration(border: Border(left: BorderSide(color: Colors.grey))),
      child: Center(child: Text(name)),
    );
  }

  Widget homePackage(String title, String imageUrl) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          ClipRRect(borderRadius: BorderRadius.circular(10), child: Container(
            color: Color(0xFFD9D9D9),
            child: Image.asset(imageUrl, width: 100, height: 100)),
          ),
          SizedBox(height: 5),
          Text(title, style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget homeProduct(String name, int price, int stock, String description, String imageUrl) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: Container(
              color: Color(0xFFD9D9D9),
              child: Image.asset(imageUrl, width: 110, height: 110, fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Rp${NumberFormat('#,##0').format(price)}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('$stock tersedia',style: TextStyle(fontSize: 12, color: Colors.grey)),
                  SizedBox(height: 5),
                  Text(description, style: TextStyle(fontSize: 12), softWrap: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
