import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'main.dart';

class TransactionScreen extends StatefulWidget {
  const TransactionScreen({super.key});
  @override
  State<TransactionScreen> createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final _selectedIndex = 3;

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
                Align(alignment: Alignment.centerLeft, child: Text('Transaksi', style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold))),
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
                    transactionProduct('2503140001', 60000, 0, 'images/tenda.png'),
                    transactionProduct('2503131000', 3000000, 1, 'images/tenda.png'),
                    transactionProduct('2412319999', 150000, 2, 'images/paket.png'),
                    transactionProduct('1111111111', 900000, 3, 'images/sepatu.png'),
                    transactionProduct('0001010001', 18000, 4, 'images/paket.png'),
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

  Widget transactionProduct(String invoice, int price, int code, String image) {
    List<String> statusList = ['Menunggu Pembayaran', 'Siap Diambil', 'Pengambilan Dikonfirmasi', 'Pengajuan Pengembalian', 'Selesai'];
    String status = statusList[code];
    return Card(
      elevation: 3,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Padding(
        padding: EdgeInsets.all(10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(borderRadius: BorderRadius.circular(10), child: Container(
              color: Theme.of(context).colorScheme.onPrimary,
              child: Image.asset(image, width: 110, height: 110, fit: BoxFit.cover)),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('NO. $invoice', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  Text('Rp${NumberFormat('#,###').format(price)}', style: TextStyle(fontSize: 16)),
                  SizedBox(height: 30),
                  Text(
                    status,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: {
                      0: Colors.red,
                      1: Colors.green,
                      2: Colors.orange,
                      3: Colors.blue,
                      4: Colors.green,
                    }[code]),
                    softWrap: true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}