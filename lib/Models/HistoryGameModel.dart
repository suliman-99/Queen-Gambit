import 'dart:convert';

class HistoryGameModel {
  int id;
  String user1;
  String user2;
  int user1RateChange;
  int user2RateChange;
  int user1GoodMoves;
  int user2GoodMoves;
  String user1Result;
  bool isTopGame;
  HistoryGameModel({
    this.id,
    this.user1,
    this.user2,
    this.user1RateChange,
    this.user2RateChange,
    this.user1GoodMoves,
    this.user2GoodMoves,
    this.user1Result,
    this.isTopGame,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user1': user1,
      'user2': user2,
      'user1RateChange': user1RateChange,
      'user2RateChange': user2RateChange,
      'user1GoodMoves': user1GoodMoves,
      'user2GoodMoves': user2GoodMoves,
      'user1Result': user1Result,
      'isTopGame': isTopGame,
    };
  }

  factory HistoryGameModel.fromMap(Map<String, dynamic> map) {
    return HistoryGameModel(
      id: map['id'],
      user1: map['user1'],
      user2: map['user2'],
      user1RateChange: map['user1RateChange'],
      user2RateChange: map['user2RateChange'],
      user1GoodMoves: map['user1GoodMoves'],
      user2GoodMoves: map['user2GoodMoves'],
      user1Result: map['user1Result'],
      isTopGame: map['isTopGame'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoryGameModel.fromJson(String source) =>
      HistoryGameModel.fromMap(json.decode(source));
}
