import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {

  final ChatMessageEntity entity;
  final Alignment alignment;
  const ChatBubble({Key? key, required this.alignment, required this.entity}) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.5),
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "${entity.text}",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            if(entity.imageUrl != null)Image.network(
                '${entity.imageUrl}'
            )
          ],
        ),
        margin: EdgeInsets.all(50),
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50),
            )),
      ),
    );
  }
}
