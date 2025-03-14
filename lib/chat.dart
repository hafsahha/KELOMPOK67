import 'package:flutter/material.dart';
import 'home.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Map<String, String>> messages = [
    {'sender': 'You', 'time': '9:41 AM', 'message': 'ka ini nanti kita ambil barang ke store langsung? atau diantar?'},
    {'sender': 'Admin', 'time': '9:41 AM', 'message': 'Untuk barangnya sendiri harus diambil sendiri oleh customer ke toko yaa <3'},
    {'sender': 'You', 'time': '9:42 AM', 'message': 'Ohh gitu ya ka, makasi ka'},
    {'sender': 'Admin', 'time': '9:42 AM', 'message': 'iyaa sama sama 🥰'},
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(85.0),
        child: AppBar(
          title: Padding(padding: EdgeInsets.only(top: 35.0), child: Text("Personal Chat", style: TextStyle(fontWeight: FontWeight.bold))),
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
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              reverse: true,
              child: Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: messages.map((message) {
                    return _buildMessage(message['sender']!, message['time']!, message['message']!);
                  }).toList(),
                ),
              ),
            ),
          ),
          
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(width: 1, color: Colors.grey),
            ),
            margin: EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ketik pesan...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFF5B3B3),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (_controller.text.isNotEmpty) {
                        messages.insert(messages.length, {
                          'sender': 'You', 'time': TimeOfDay.now().format(context),
                          'message': _controller.text,
                        });
                        _controller.clear();
                      }
                    });
                  },
                  child: Container(
                    width: 44, height: 44,
                    decoration: BoxDecoration(color: Color(0xFFE7A3A3), shape: BoxShape.circle),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(String sender, String time, String message) {
    bool isAdmin = sender == 'Admin';
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isAdmin ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: [
          if (isAdmin)
            CircleAvatar(radius: 20, backgroundColor: Colors.grey,
              child: Text('A', style: TextStyle(color: Colors.white)),
            )
          else SizedBox(width: 40),

          SizedBox(width: 8),
          
          Container(
            padding: EdgeInsets.all(12),
            constraints: BoxConstraints(maxWidth: 250),
            decoration: BoxDecoration(
              color: isAdmin ? Colors.blueAccent : Color(0xFFE7A3A3),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(height: 4),
                Text(
                  time,
                  style: TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
