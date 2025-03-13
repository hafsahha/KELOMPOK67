import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://placehold.co/110x110"),
                      fit: BoxFit.cover,
                    ),
                    shape: OvalBorder(side: BorderSide(width: 1)),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F000000),
                        blurRadius: 4,
                        offset: Offset(0, 4),
                        spreadRadius: 0,
                      ),
                    ],
                  ),
                ),
              ),
              // Name
              Center(
                child: Text(
                  'Karina',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Email
              Center(
                child: Text(
                  'aespa@upi.edu',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.5),
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 30),

              // Account Section
              _buildSectionHeader('Akunmu'),
              _buildSectionItem('Edit profil'),
              _buildSectionItem('Kontak'),
              _buildSectionItem('Laporkan Masalah'),

              const SizedBox(height: 20),

              // Help Section
              _buildSectionHeader('Bantuan'),
              _buildSectionItem('Ketentuan Layanan'),
              _buildSectionItem('Kebijakan Privasi'),

              const SizedBox(height: 30),

              // Logout Section
              _buildSectionHeader('Lainnya'),
              _buildSectionItem('Keluar', isRed: true),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 70,
        color: Color(0xFFE7A3A3), 
        child: TextButton(
          onPressed: () {
            // Implement your "Ajukan Pengembalian" action here
            print("Ajukan Pengembalian button clicked!");
          },
          child: Text(
            'Ajukan Pengembalian',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  // Helper method to build section headers
  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black.withOpacity(0.7),
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Helper method to build section items
  Widget _buildSectionItem(String title, {bool isRed = false}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              color: isRed ? Color(0xFFDB3E3E) : Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
