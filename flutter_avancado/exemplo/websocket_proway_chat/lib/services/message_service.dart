import 'dart:convert';

import 'package:web_socket_channel/io.dart';
import 'package:websocket_proway_chat/models/message_model.dart';

typedef MessageServiceOnGetMessage = void Function(MessageModel messageModel);

class MessageService {
  late IOWebSocketChannel _channel;

  MessageService() {
    _initChannel();
  }

  void _initChannel() {
    _channel = IOWebSocketChannel.connect(
        "wss://free.blr2.piesocket.com/v3/1?api_key=6MA8nfVjcRbp9JL5cMVnuf4zk2mQxMSHkZrEyhBT&notify_self=1",
        headers: {},
        pingInterval: const Duration(seconds: 5));
  }

  void broadcast(MessageServiceOnGetMessage onGetMessage) {
    _channel.stream.listen((event) {
      var result = (jsonDecode(event));

      MessageModel messageModel =
          MessageModel.fromJson(result );

      onGetMessage(messageModel);
    });
  }

  void sendMessage(MessageModel messageModel) {
    _channel.sink.add(jsonEncode(messageModel.toJson()));
  }
}
