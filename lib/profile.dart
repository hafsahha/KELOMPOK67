import 'package:flutter/material.dart';
import 'home.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 35.0), child: Text("User Profile", style: TextStyle(fontWeight: FontWeight.bold))),
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
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                  
                    // Foto Profil
                    Container(
                      width: 120, height: 120,
                      decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 1), shape: BoxShape.circle),
                      child: ClipOval(child: Image.asset('images/profile.jpg', width: 120, height: 120, fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10),

                    // Nama dan Email
                    Text('Karina', textAlign: TextAlign.center, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Text('aespa@upi.edu', textAlign: TextAlign.center, style: TextStyle(color: Colors.black.withValues(alpha: 0.5), fontSize: 15)),
                  ],
                ),
              ),
              SizedBox(height: 30),

              // Account Section
              profileSectionHeader('Akun'),
              profileSectionItem('Edit profil'),
              profileSectionItem('Kontak'),
              profileSectionItem('Laporkan Masalah'),
              SizedBox(height: 20),

              // Help Section
              profileSectionHeader('Bantuan'),
              profileSectionItem('Ketentuan Layanan'),
              profileSectionItem('Kebijakan Privasi'),
              SizedBox(height: 20),

              // Logout Section
              profileSectionHeader('Lainnya'),
              profileSectionItem('Keluar', isRed: true),
            ],
          ),
        ),
      ),
    );
  }

  // Widget untuk membuat header section
  Widget profileSectionHeader(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(title, style: TextStyle(color: Colors.black.withValues(alpha: 0.7), fontSize: 14, fontWeight: FontWeight.w500)),
    );
  }

  // Widget untuk membuat item section
  Widget profileSectionItem(String title, {bool isRed = false}) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(10),
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFE5E5E5)),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(color: isRed ? Color(0xFFDB3E3E) : Colors.black, fontSize: 16, fontWeight: FontWeight.w500)),
          Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black),
        ],
      ),
    );
  }
}
