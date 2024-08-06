import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatelessWidget {
  final Function(ChatMessageEntity) onSubmit;
  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  final chatMessageController = TextEditingController();

  void onSendPressed() {
    print('Chat Message: ${chatMessageController.text}');

    final newChatMessage = new ChatMessageEntity(
        text: chatMessageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: 'Jamie'));

    onSubmit(newChatMessage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
              child: TextField(
            keyboardType: TextInputType.multiline,
            minLines: 1,
            maxLines: 6,
            controller: chatMessageController,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Message",
                hintStyle: TextStyle(color: Colors.blueGrey)),
            style: TextStyle(color: Colors.white),
          )),
          IconButton(
            onPressed: onSendPressed,
            icon: Icon(Icons.send),
            color: Colors.white,
          )
        ],
      ),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(),
      ),
    );
  }
}
