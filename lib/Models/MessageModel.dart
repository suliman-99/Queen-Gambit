import 'dart:convert';

class MessageModel {
  String message;
  int sender;
  MessageModel({this.message, this.sender});

  Map<String, dynamic> toMap() {
    return {
      'message': message,
      'sender': sender,
    };
  }

  factory MessageModel.fromMap(Map<String, dynamic> map) {
    return MessageModel(
      message: map['message'],
      sender: map['sender'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MessageModel.fromJson(String source) =>
      MessageModel.fromMap(json.decode(source));
}
