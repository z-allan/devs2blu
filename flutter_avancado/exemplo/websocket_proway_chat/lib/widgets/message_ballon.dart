import "package:flutter/material.dart";
import "package:websocket_proway_chat/models/message_model.dart";
import "package:websocket_proway_chat/widgets/message_body.dart";

class MessageBallon extends StatelessWidget {
  final MessageModel messageModel;
  final String currentUser;

  const MessageBallon(
      {required this.messageModel, required this.currentUser, super.key});

  @override
  Widget build(BuildContext context) {
    if (messageModel.type == MessageType.enterRoom) {
      return Container(
        width: double.infinity,
        alignment: Alignment.center,
        child: Card(
          color: Colors.black12,
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(messageModel.message, style: const TextStyle(fontSize: 10, color: Colors.white),),
          ),
        ),
      );
    }

    return Container(
      width: double.infinity,
      alignment: (currentUser == messageModel.sender
          ? Alignment.topRight
          : Alignment.topLeft),
      child: MessageBody(
        color: (currentUser == messageModel.sender
            ? Colors.green
            : Colors.deepPurpleAccent),
        messageModel: messageModel,
        textAligment: (currentUser == messageModel.sender
            ? CrossAxisAlignment.end
            : CrossAxisAlignment.start),
      ),
    );
  }
}
