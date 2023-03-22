import 'dart:convert';

class LobbyModel {
  int id;
  String type;
  int usersNum;
  int maxUserNum;
  List<String> users;
  LobbyModel({this.id, this.type, this.usersNum, this.maxUserNum, this.users});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'type': type,
      'usersNum': usersNum,
      'maxNum': maxUserNum,
      'users': users,
    };
  }

  factory LobbyModel.fromMap(Map<String, dynamic> map) {
    return LobbyModel(
      id: map['id'],
      type: map['type'],
      usersNum: map['usersNum'],
      maxUserNum: map['maxNum'],
      users: List<String>.from(map['users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LobbyModel.fromJson(String source) =>
      LobbyModel.fromMap(json.decode(source));
}
