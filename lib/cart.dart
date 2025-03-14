import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final _selectedIndex = 4;

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
                Align(alignment: Alignment.centerLeft, child: Text('Cart', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold))),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(right: 20, left: 20),
                  child: Column(
                  children: [
                    cartProduct('Tenda A', 60000, 5, 'images/tenda.png'),
                    cartProduct('Sepatu Gunung', 30000, 10, 'images/sepatu.png'),
                    cartProduct('Item 3', 1000, 0, 'images/question.png'),
                    cartProduct('Item 4', 2000, 0, 'images/question.png'),
                    cartProduct('Item 5', 3000, 0, 'images/question.png'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: mainNavbar(context, _selectedIndex),
    );
  }

  Widget cartProduct(String name, int price, int quantity, String image) {
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
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    SizedBox(),
                    cartCounter(quantity),
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

  Widget cartCounter(int quantity) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), borderRadius: BorderRadius.circular(10)),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            IconButton(icon: Icon(Icons.remove), onPressed: () {}),
            Text(quantity.toString(), style: TextStyle(fontSize: 16)),
            IconButton(icon: Icon(Icons.add), onPressed: () {}),
        ],
      ),
    );
  }
}