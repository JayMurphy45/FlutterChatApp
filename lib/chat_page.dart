import 'dart:convert';

import 'package:chat_app/models/image_model.dart';
import 'package:chat_app/repo/image_repository.dart';
import 'package:http/http.dart' as http;
import 'package:chat_app/Widgets/chat_bubble.dart';
import 'package:chat_app/Widgets/chat_input.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChatPage extends StatefulWidget {
  ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  //initial state of messages
  List<ChatMessageEntity> _messages = [];

  _loadInitialMessages() async {
    rootBundle.loadString('assets/mock_messages.json').then((response) {
      final List<dynamic> decodedList = jsonDecode(response) as List;

      final List<ChatMessageEntity> _chatMessages = decodedList.map((listItem) {
        return ChatMessageEntity.fromJson(listItem);
      }).toList();

      print(_chatMessages.length);

      //final state of messages
      setState(() {
        _messages = _chatMessages;
      });
    }).then((_) {
      print('Done');
    });

    print("test");
  }

  onMessageSent(ChatMessageEntity entity) {
    _messages.add(entity);
    setState(() {});
  }



  @override
  void initState() {
    _loadInitialMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final username = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Hi $username"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, '/');
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: _messages.length,
                  itemBuilder: (context, index) {
                    return ChatBubble(
                        alignment: index % 2 == 0
                            ? Alignment.centerLeft
                            : Alignment.centerRight,
                        entity: _messages[index]);
                  })),
          ChatInput(
            onSubmit: onMessageSent,
          )
        ],
      ),
    );
  }
}
