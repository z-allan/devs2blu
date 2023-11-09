import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:websocket_proway_chat/models/message_model.dart";
import "package:websocket_proway_chat/providers/message_provider.dart";
import "package:websocket_proway_chat/providers/userDataProvider.dart";

class ImageSenderDialog extends ConsumerWidget {
  final TextEditingController urlController = TextEditingController();

  ImageSenderDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AlertDialog(
      title: const Text("Enviar uma image"),
      content: Padding(
        padding: const EdgeInsets.all(10),
        child: TextField(
          controller: urlController,
          decoration: const InputDecoration(labelText: "URL da Imagem"),
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {
              if (urlController.text.isNotEmpty) {
                String user = ref.watch(userDataProvider) as String;

                ref.read(messageProvider.notifier).sendMessage(
                    MessageModel.linkImage(
                        sender: user, message: urlController.text));

                Navigator.pop(context);
              }
            },
            icon: const Icon(
              Icons.imagesearch_roller,
              color: Colors.greenAccent,
            ))
      ],
    );
  }
}
