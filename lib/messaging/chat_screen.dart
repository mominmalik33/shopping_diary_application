import 'package:flutter/material.dart';
import 'new_messages.dart';
import 'messages.dart';

class ChatScreen extends StatefulWidget {

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat Window'),
        backgroundColor: Color(0xFF07db63),
        centerTitle: true,
        actions: [
          IconButton(
            icon:Icon(Icons.chat_bubble_outlined),
            onPressed: (){},
          ),
        ],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
