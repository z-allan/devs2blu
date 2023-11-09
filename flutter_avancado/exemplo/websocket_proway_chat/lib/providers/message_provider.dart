import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:websocket_proway_chat/models/message_model.dart';

import '../services/message_service.dart';

class MessageProvider extends StateNotifier<List<MessageModel>> {
  MessageService messageService = MessageService();

  MessageProvider(super.state) {
    messageService.broadcast((messageModel) {
      state = [...state, messageModel];
    });
  }

  void sendMessage(MessageModel messageModel) {
    messageService.sendMessage(messageModel);
  }
}

final messageProvider = StateNotifierProvider((ref) => MessageProvider([]));