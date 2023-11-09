import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:websocket_proway_chat/models/message_model.dart";
import "package:websocket_proway_chat/providers/message_provider.dart";
import "package:websocket_proway_chat/providers/userDataProvider.dart";
import "package:websocket_proway_chat/widgets/image_sender_dialog.dart";

class MessageForm extends ConsumerWidget {
  final TextEditingController messageController = TextEditingController();

  MessageForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String user = ref.watch(userDataProvider) as String;
    //user = 'Quinotto';

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TextField(
        controller: messageController,
        onSubmitted: (value) {
          ref
              .read(messageProvider.notifier)
              .sendMessage(MessageModel(sender: user, message: value));

          messageController.text = "";
        },
        decoration: InputDecoration(
            labelText: "Digite aqui a sua mensagem",
            prefix: IconButton(
              icon: const Icon(Icons.photo_camera, color: Colors.greenAccent),
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return ImageSenderDialog();
                },);
              },
            ),
            suffix: IconButton(
              onPressed: () {
                ref.read(messageProvider.notifier).sendMessage(MessageModel(
                    sender: user, message: messageController.text));

                messageController.text = "";
              },
              icon: const Icon(
                Icons.send,
                color: Colors.greenAccent,
              ),
            )),
      ),
    );
  }
}
