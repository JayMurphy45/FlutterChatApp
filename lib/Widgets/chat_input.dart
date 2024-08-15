import 'package:chat_app/Widgets/picker_body.dart';
import 'package:chat_app/models/chat_message_entity.dart';
import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final Function(ChatMessageEntity) onSubmit;

  ChatInput({Key? key, required this.onSubmit}) : super(key: key);

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  String _selectedImageUrl = '';

  final chatMessageController = TextEditingController();

  void onSendPressed() {
    print('Chat Message: ${chatMessageController.text}');

    final newChatMessage = new ChatMessageEntity(
        text: chatMessageController.text,
        id: '244',
        createdAt: DateTime.now().millisecondsSinceEpoch,
        author: Author(username: 'Jamie'));

    if(_selectedImageUrl.isNotEmpty){
      newChatMessage.imageUrl = _selectedImageUrl;
    }
    widget.onSubmit(newChatMessage);
    chatMessageController.clear();
    _selectedImageUrl = '';
    setState(() {

    });
  }

  onImagePicked(String newImageUrl) {
    setState(() {
      _selectedImageUrl = newImageUrl;
    });
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              //opens a bottom shit that shows images
              showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return NetworkImagePickerBody(
                      onImageSelected: onImagePicked,
                    );
                  });
            },
            icon: Icon(Icons.add),
            color: Colors.white,
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextField(
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
                            ),
                  if(_selectedImageUrl.isNotEmpty)
                    Image.network(_selectedImageUrl,height: 50,)

                ],
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
