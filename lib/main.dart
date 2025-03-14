import 'package:flutter/material.dart';
import 'home.dart';
import 'chat.dart';
import 'wishlist.dart';
import 'profile.dart';
import 'voucher.dart';

import 'detail_item.dart';
import 'detail_paket.dart';
import 'detail_sewa1.dart';
import 'detail_sewa2.dart';

import 'transaction.dart';
import 'checkout.dart';
import 'cart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.black,
        onPrimary: Color(0xFFFFE8E8),
        secondary: Colors.black,
        onSecondary: Color(0xFFD36E6E),
        error: Colors.red,
        onError: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black,
      )),
      title: 'Camp',
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});
    @override
    State<HomePage> createState() => _State();
}

class _State extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          spacing: 20,
          children: [
            SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Text('Quiz 1: UI', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),

                  Container(
                    width: 120, height: 120,
                    decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), shape: BoxShape.circle),
                    child: ClipOval(child: Image.asset('images/profile.jpg', width: 120, height: 120, fit: BoxFit.cover)),
                  ),
                  SizedBox(height: 5),

                  Text('Kelompok 67 - Campink', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  SizedBox(height: 5),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Tampilan Utama', textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Inter')),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                  ])),
                  Column(
                    children: [
                      mainButton('Home', HomeScreen()),
                      mainButton('Chat', ChatScreen()),
                      mainButton('Voucher', VoucherScreen()),
                      mainButton('Wishlist', WishlistScreen()),
                      mainButton('Profile User', ProfileScreen()),
                    ],
                  ),

                  SizedBox(height: 10),
                  SizedBox(child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Tampilan Detail', textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Inter')),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                  ])),
                  Column(
                    children: [
                      mainButton('Detail Item', DetailItemScreen()),
                      mainButton('Detail Paket', DetailPaketScreen()),
                      mainButton('Detail Transaksi 1 (Summary)', DetailSewa1Screen()),
                      mainButton('Detail Transaksi 2 (Return)', DetailSewa2Screen()),
                    ]
                  ),

                  SizedBox(height: 10),
                  SizedBox(child: Column(children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Transaksi', textAlign: TextAlign.start, style: TextStyle(fontSize: 20, fontFamily: 'Inter')),
                    ),
                    Divider(color: Colors.black, thickness: 1),
                  ])),
                  Column(
                    children: [
                      mainButton('Monitor Transaksi', TransactionScreen()),
                      mainButton('Keranjang', CartScreen()),
                      mainButton('Checkout', CheckoutScreen())
                    ]
                  ),
                ],
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mainButton(String page, Widget dest) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => dest),
          );
        },
        child: Text(page, style: TextStyle(fontSize: 20)),
      ),
    );
  }
}

Widget mainNavbar(BuildContext context, int idx) {
  List<Widget> pages = [
    HomeScreen(),
    ChatScreen(),
    WishlistScreen(),
    TransactionScreen(),
    CartScreen(),
  ];
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20),
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.onPrimary,
      borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
      ),
      boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), spreadRadius: 2, blurRadius: 5, offset: Offset(0, -5))],
    ),
    child: BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      selectedItemColor: Theme.of(context).colorScheme.onSecondary,
      unselectedItemColor: Color(0xFFE7A3A3),
      currentIndex: idx,
      onTap: (index) {
        int selected = index;
        if (selected != idx) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => pages[selected]),
          );
        }
      },
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chat'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Wishlist'),
        BottomNavigationBarItem(icon: Icon(Icons.payment), label: 'Transaksi'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
      ],
    ),
  );
}