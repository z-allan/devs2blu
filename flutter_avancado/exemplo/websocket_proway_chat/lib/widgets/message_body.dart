import "package:flutter/material.dart";
import "package:websocket_proway_chat/models/message_model.dart";

class MessageBody extends StatelessWidget {
  final MessageModel messageModel;
  final Color color;
  final CrossAxisAlignment textAligment;

  const MessageBody(
      {required this.color,
      required this.messageModel,
      required this.textAligment,
      super.key});

  Widget _getBody(double width) {
    if (messageModel.type == MessageType.imageLink) {
      return Image.network(messageModel.message, width: width,);
    }

    return Text(
      messageModel.message,
      style: const TextStyle(fontSize: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width / 3;

    return Card(
      color: color,
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: textAligment,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              messageModel.sender,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
            ),
            _getBody(width),
            Text(
              messageModel.createdAt,
              style: const TextStyle(fontSize: 8),
            ),
          ],
        ),
      ),
    );
  }
}
