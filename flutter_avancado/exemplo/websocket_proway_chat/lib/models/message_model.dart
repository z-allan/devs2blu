enum MessageType { text, enterRoom, imageLink }

class MessageModel {
  String sender = ""; // Remetente
  String message = ""; // Mensagem
  String createdAt = "";
  MessageType type = MessageType.text;

  MessageModel({required this.sender, required this.message}) {
    type = MessageType.text;

    DateTime now = DateTime.now();

    createdAt = "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
  }

  MessageModel.enterRoom({required this.sender}) {
    type = MessageType.enterRoom;

    this.message = "$sender entrou na sala";

    DateTime now = DateTime.now();

    createdAt = "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
  }

  MessageModel.linkImage({required this.sender, required this.message}) {
    type = MessageType.imageLink;

    DateTime now = DateTime.now();

    createdAt = "${now.day}/${now.month}/${now.year} ${now.hour}:${now.minute}";
  }

  MessageModel.fromJson(Map<String, dynamic> json) {
    sender = json["sender"];
    message = json["message"];
    createdAt = json["created_at"];
    type = MessageType.values[json["type"]];
  }

  Map<String, dynamic> toJson() {
    return {
      "sender": sender,
      "message": message,
      "created_at": createdAt,
      "type": type.index
    };
  }
}
