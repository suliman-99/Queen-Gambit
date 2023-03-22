import 'dart:convert';

class UserModel {
  String name;
  int rate;
  int avatar;
  int gamePlayed;
  int winRate;
  int looseRate;
  List<String> friends;
  UserModel({
    this.name,
    this.rate,
    this.avatar,
    this.gamePlayed,
    this.winRate,
    this.looseRate,
    this.friends,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rate': rate,
      'avatar': avatar,
      'gamePlayed': gamePlayed,
      'winRate': winRate,
      'loseRate': looseRate,
      'friends': friends,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      rate: map['rate'],
      avatar: map['avatar'],
      gamePlayed: map['gamePlayed'],
      winRate: map['winRate'],
      looseRate: map['loseRate'],
      friends: List<String>.from(map['friends']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));
}
