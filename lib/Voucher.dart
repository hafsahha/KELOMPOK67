import 'package:flutter/material.dart';

class VoucherPage extends StatefulWidget {
  const VoucherPage({super.key});

  @override
  _VoucherPageState createState() => _VoucherPageState();
}

class _VoucherPageState extends State<VoucherPage> {
  // Declare a variable to store the selected voucher
  String? selectedVoucher;

  // Function to update the selected voucher
  void _onVoucherSelected(String? value) {
    setState(() {
      selectedVoucher = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Voucher"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // Voucher 1: Cashback 20%
                    _buildVoucherItem(
                      'Cashback 20%',
                      'Min. pembelanjaan 300.000',
                      'Cashback 20%',
                    ),
                    // Voucher 2: Diskon 10%
                    _buildVoucherItem(
                      'Diskon 10%',
                      'Min. pembelanjaan 100.000',
                      'Diskon 10%',
                    ),
                    // Voucher 3: Diskon 50%
                    _buildVoucherItem(
                      'Diskon 50%',
                      'Untuk pembelanjaan pertama',
                      'Diskon 50%',
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Bottom Action Button
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                // Handle the voucher selection
                if (selectedVoucher != null) {
                  print("Voucher Selected: $selectedVoucher");
                } else {
                  print("No voucher selected");
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFF5B3B3), // Button color
                minimumSize: Size(double.infinity, 50), // Full width button
              ),
              child: const Text('Oke', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }

  // Voucher item widget with radio buttons
  Widget _buildVoucherItem(String title, String subtitle, String value) {
    return GestureDetector(
      onTap: () => _onVoucherSelected(value),
      child: Container(
        width: double.infinity,
        height: 86,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Color(0xFFD26E6E), width: 1),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Radio<String>(
              value: value,
              groupValue: selectedVoucher,
              onChanged: _onVoucherSelected,
              activeColor: Color(0xFFF5B3B3),
            ),
          ],
        ),
      ),
    );
  }
}
