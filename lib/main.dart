import 'package:chat_app/chat_page.dart';
import 'package:chat_app/counter.dart';
import 'package:chat_app/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: "Flutter chat app",
      theme: ThemeData(primarySwatch: Colors.purple),
      home: LoginPage(),
      routes: {
        '/chat': (context) => ChatPage()
      },
    );
  }
}

//TODO make chat app
//TODO make login page
