import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/GameViewModel.dart';

class GamesController {
  Future<List<GameViewModel>> getHistoryGamesByName(String name) async {
    await Firebase.initializeApp();
    var gamesResponse =
        await FirebaseFirestore.instance.collection('historyGames').get();
    var usersResponse = await UserController().getUsers();
    List<GameViewModel> games = gamesResponse.docs
        .where(
            (el) => (el.data()['user1'] == name || el.data()['user2'] == name))
        .map<GameViewModel>((e) => GameViewModel(
            id: e.data()['id'],
            user1: e.data()['user1'],
            user1avatar: usersResponse
                .firstWhere((el) => (el.name == e.data()['user1']))
                .avatar,
            user1goodMoves: e.data()['user1GoodMoves'],
            user1rateChange: e.data()['user1RateChange'],
            user1result: e.data()['user1Result'],
            user2: e.data()['user2'],
            user2avatar: usersResponse
                .firstWhere((el) => (el.name == e.data()['user2']))
                .avatar,
            user2goodMoves: e.data()['user2GoodMoves'],
            user2rateChange: e.data()['user2RateChange']))
        .toList();
    return games;
  }

  Future<List<GameViewModel>> getTopGames() async {
    await Firebase.initializeApp();
    var response = await FirebaseFirestore.instance
        .collection('historyGames')
        .where('isTopGame', isEqualTo: true)
        .get();
    var usersResponse = await UserController().getUsers();
    List<GameViewModel> games = response.docs
        .map<GameViewModel>(
          (e) => GameViewModel(
            id: e.data()['id'],
            user1: e.data()['user1'],
            user1avatar: usersResponse
                .firstWhere((el) => (el.name == e.data()['user1']))
                .avatar,
            user1goodMoves: e.data()['user1GoodMoves'],
            user1rateChange: e.data()['user1RateChange'],
            user1result: e.data()['user1Result'],
            user2: e.data()['user2'],
            user2avatar: usersResponse
                .firstWhere((el) => (el.name == e.data()['user2']))
                .avatar,
            user2goodMoves: e.data()['user2GoodMoves'],
            user2rateChange: e.data()['user2RateChange'],
          ),
        )
        .toList();
    return games;
  }
}
