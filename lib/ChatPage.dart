import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  // Dummy data for chat messages
  List<Map<String, String>> messages = [
    {'sender': 'You', 'time': '9:41', 'message': 'ka ini nanti kita ambil barang ke store langsung? atau diantar?'},
    {'sender': 'Admin', 'time': '9:41', 'message': 'Untuk barangnya sendiri harus diambil sendiri oleh customer ke toko yaa <3'},
    {'sender': 'You', 'time': '9:42', 'message': 'Ohh gitu ya ka, makasi ka'},
    {'sender': 'Admin', 'time': '9:42', 'message': 'iyaa sama sama 🥰'},
  ];

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat Personal"),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Chat message list (scrollable)
          Expanded(
            child: SingleChildScrollView(
              reverse: true, // Scroll to the bottom initially
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: messages.map((message) {
                    return _buildMessage(message['sender']!, message['time']!, message['message']!);
                  }).toList(),
                ),
              ),
            ),
          ),
          // Message input field (sticky at bottom)
          Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(50),
            border: Border.all(width: 1, color: Colors.grey),
          ),
          margin: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              // Text input field with full width
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),  // Added padding
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type Here',
                      border: InputBorder.none,
                      hintStyle: TextStyle(
                        color: Color(0xFFF5B3B3),
                        fontSize: 17,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
      // Send button
      GestureDetector(
        onTap: () {
          setState(() {
            // Add message to the list
            if (_controller.text.isNotEmpty) {
              messages.insert(0, {
                'sender': 'You',
                'time': '9:42',
                'message': _controller.text,
              });
              _controller.clear(); // Clear input after sending
            }
          });
        },
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: Color(0xFFE7A3A3),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.send,
            color: Colors.white,
          ),
        ),
      ),
    ],
  ),
)

        ],
      ),
    );
  }

  // Build Message Bubble
  Widget _buildMessage(String sender, String time, String message) {
    bool isAdmin = sender == 'Admin'; // Determine if the message is from Admin
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: isAdmin ? MainAxisAlignment.start : MainAxisAlignment.end, // Align left for Admin, right for You
        children: [
          if (isAdmin)
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.grey,
              child: const Text(
                'A',
                style: TextStyle(color: Colors.white),
              ),
            )
          else
            const SizedBox(width: 40), // Padding to keep space for the user

          const SizedBox(width: 8),
          // Message Bubble
          Container(
            padding: const EdgeInsets.all(12),
            constraints: BoxConstraints(maxWidth: 250), // Limiting the max width of the bubble
            decoration: BoxDecoration(
              color: isAdmin ? Colors.blueAccent : Color(0xFFE7A3A3), // Blue for Admin, Pink for User
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
                const SizedBox(height: 4),
                Text(
                  time,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
