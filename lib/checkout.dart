import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'cart.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});
  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 35.0), child: Text("Checkout", style: TextStyle(fontWeight: FontWeight.bold))),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          leading: Padding(
            padding: EdgeInsets.only(top: 25),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () { Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => CartScreen(),)); },
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                  children: [
                    checkoutProduct('Tenda A', 60000, 5, 'images/tenda.png'),
                    checkoutProduct('Sepatu Gunung', 30000, 10, 'images/sepatu.png'),
                    checkoutProduct('Item 3', 1000, 0, 'images/question.png'),
                    checkoutProduct('Item 4', 2000, 0, 'images/question.png'),
                    checkoutProduct('Item 5', 3000, 0, 'images/question.png'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: checkoutBar(),
    );
  }

  Widget checkoutProduct(String name, int price, int quantity, String image) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                color: Theme.of(context).colorScheme.onPrimary,
                child: Image.asset(image, width: 110, height: 110, fit: BoxFit.cover),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Rp${NumberFormat('#,###').format(price)}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(),
                    Text('$quantity x', style: TextStyle(fontSize: 16)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget checkoutBar() {
    return Container(
    width: 390,
    height: 100,
    decoration: BoxDecoration(
        color: Color(0xFFFFE8E8),
        boxShadow: [
            BoxShadow(
                color: Color(0x3F000000),
                blurRadius: 4,
                offset: Offset(0, 4),
                spreadRadius: 0,
            )
        ],
    ),
    child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
            Container(
                width: 195,
                height: 70,
                child: Stack(
                    children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                                width: 195,
                                height: 70,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFFFE8E8),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                        ),
                                    ),
                                ),
                            ),
                        ),
                        Positioned(
                            left: 49,
                            top: 24,
                            child: SizedBox(
                                width: 97,
                                height: 22,
                                child: Text(
                                    'Rp. 000.000',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 1.38,
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
            Container(
                width: 195,
                height: 70,
                child: Stack(
                    children: [
                        Positioned(
                            left: 0,
                            top: 0,
                            child: Container(
                                width: 195,
                                height: 70,
                                decoration: ShapeDecoration(
                                    color: Color(0xFFE7A3A3),
                                    shape: RoundedRectangleBorder(
                                        side: BorderSide(
                                            width: 1,
                                            strokeAlign: BorderSide.strokeAlignCenter,
                                        ),
                                    ),
                                ),
                            ),
                        ),
                        Positioned(
                            left: 45,
                            top: 24,
                            child: SizedBox(
                                width: 106,
                                height: 22,
                                child: Text(
                                    'Buat Pesanan',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 1.38,
                                    ),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        ],
    ),
);
  }
}