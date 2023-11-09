import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:websocket_proway_chat/providers/userDataProvider.dart";
import "package:websocket_proway_chat/widgets/message_form.dart";
import "package:websocket_proway_chat/widgets/message_list.dart";


class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String user = ref.watch(userDataProvider) as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("Usuário atual: $user"),
      ),
      body: const Padding(
        padding: EdgeInsets.only(bottom: 100),
        child: MessageList(),
      ),
      bottomSheet: MessageForm(),
    );
  }
}
