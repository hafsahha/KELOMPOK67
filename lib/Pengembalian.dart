import 'package:flutter/material.dart';

class Pengembalian extends StatelessWidget {
  const Pengembalian({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Penyewaan"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Personal and Invoice Details
              _buildDetailRow('Nama', 'Karina'),
              _buildDetailRow('Penjemputan', 'XX/XX/XX'),
              _buildDetailRow('Pengembalian', 'XX/XX/XX'),
              _buildDetailRow('No. Invoice', 'XXXXXXXXXX'),

              const SizedBox(height: 20),

              // Status Tracking Section
              _buildStatusTracking('Persiapan Barang', '00:00 XX/XX/XX'),
              _buildStatusTracking('Barang Siap Diambil', '00:00 XX/XX/XX'),
              _buildStatusTracking('Barang Telah Diambil', '00:00 XX/XX/XX'),
              _buildStatusTracking('Pengajuan Pengambilan', '00:00 XX/XX/XX'),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          // Implement the functionality for the button
          print('Ajukan Pengembalian clicked');
        },
        child: Container(
          width: double.infinity, // Ensures it stretches across the screen width
          height: 70, // Height of the footer
          color: Color(0xFFE7A3A3), // Background color for the footer
          child: Center(
            child: Text(
              'Ajukan Pengembalian',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Helper for displaying individual detail rows
  Widget _buildDetailRow(String label, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              '$label :',
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Text(
            value,
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  // Helper for displaying status tracking
  Widget _buildStatusTracking(String status, String time) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20),
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            status,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            time,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
