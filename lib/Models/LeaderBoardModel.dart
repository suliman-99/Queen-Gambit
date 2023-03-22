import 'dart:convert';

class LeaderBoardModel {
  List<String> users;
  LeaderBoardModel({this.users});

  Map<String, dynamic> toMap() {
    return {
      'users': users,
    };
  }

  factory LeaderBoardModel.fromMap(Map<String, dynamic> map) {
    return LeaderBoardModel(
      users: List<String>.from(map['users']),
    );
  }

  String toJson() => json.encode(toMap());

  factory LeaderBoardModel.fromJson(String source) =>
      LeaderBoardModel.fromMap(json.decode(source));
}
