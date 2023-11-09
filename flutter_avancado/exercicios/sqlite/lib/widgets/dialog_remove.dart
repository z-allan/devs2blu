import 'package:flutter/material.dart';

class RemoveDialogWidget extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback confirmButtonAction;

  const RemoveDialogWidget(
      {required this.title,
      required this.content,
      required this.confirmButtonAction,
      super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
            onPressed: () {
              confirmButtonAction();
              Navigator.pop(context);
            },
            child: const Text('Sim')),
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Não'))
      ],
    );
  }
}
