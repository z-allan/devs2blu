import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:websocket_proway_chat/models/message_model.dart";
import "package:websocket_proway_chat/providers/message_provider.dart";
import "package:websocket_proway_chat/providers/userDataProvider.dart";

import "message_ballon.dart";

class MessageList extends ConsumerWidget {
  const MessageList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String user = ref.watch(userDataProvider) as String;
    List<MessageModel> messages =
        ref.watch(messageProvider) as List<MessageModel>;

    messages = messages.reversed.toList();

    return ListView.builder(
        reverse: true,
        itemCount: messages.length,
        itemBuilder: (context, index) =>
            MessageBallon(messageModel: messages[index], currentUser: user));
  }
}
