import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:websocket_proway_chat/models/message_model.dart";
import "package:websocket_proway_chat/providers/message_provider.dart";
import "package:websocket_proway_chat/providers/userDataProvider.dart";
import "package:websocket_proway_chat/screens/chat_screen.dart";

class LoginScreen extends ConsumerWidget {
  final TextEditingController userController = TextEditingController();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(
              Icons.chat_outlined,
              color: Colors.orange,
              size: 128,
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: TextField(
                controller: userController,
                decoration: const InputDecoration(
                    labelText: "Seu nome de usuário",
                    prefixIcon: Icon(Icons.person)),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (userController.text
              .trim()
              .isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("O campo usuário é obrigatório")));

            return;
          }

          ref.read(userDataProvider.notifier).setUserName(userController.text);

          ref.read(messageProvider.notifier).sendMessage(
              MessageModel.enterRoom(sender: userController.text));

          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => const ChatScreen(),
          ));
        },
        child: const Icon(Icons.security),
      ),
    );
  }
}
