import 'dart:convert';

import 'package:flagfall/Models/MessageModel.dart';

class ChatModel {
  int id;
  String user1;
  String user2;
  List<MessageModel> messages;
  ChatModel({this.id, this.user1, this.user2, this.messages});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
      'messages': messages?.map((x) => x.toMap())?.toList(),
    };
  }

  factory ChatModel.fromMap(Map<String, dynamic> map) {
    return ChatModel(
      id: map['id'],
      user1: map['user1'],
      user2: map['user2'],
      messages: List<MessageModel>.from(
          map['messages']?.map((x) => MessageModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChatModel.fromJson(String source) =>
      ChatModel.fromMap(json.decode(source));
}
