import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Models/LobbyModel.dart';
import 'package:flagfall/Models/UserModel.dart';
import 'package:flagfall/ViewModels/LobbyViewModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';

class LobbyController {
  Future<LobbiesViewModel> getLobbies(String name) async {
    await Firebase.initializeApp();
    var lobbiesRes =
        await FirebaseFirestore.instance.collection('lobbies').get();
    var usersRes = await FirebaseFirestore.instance.collection('users').get();
    List<LobbyModel> llm = [];
    for (int i = 0; i < lobbiesRes.docs.length; i++) {
      List<String> ls = [];
      for (int j = 0; j < lobbiesRes.docs[i].data()['users'].length; j++) {
        ls.add(lobbiesRes.docs[i].data()['users'][j]);
      }
      LobbyModel lm = LobbyModel(
        id: lobbiesRes.docs[i].data()['id'],
        type: lobbiesRes.docs[i].data()['type'],
        usersNum: lobbiesRes.docs[i].data()['usersNum'],
        maxUserNum: lobbiesRes.docs[i].data()['maxNum'],
        users: ls,
      );
      llm.add(lm);
    }
    List<UserModel> lum = [];
    for (int i = 0; i < usersRes.docs.length; i++) {
      List<String> ls = [];
      for (int j = 0; j < usersRes.docs[i].data()['friends'].length; j++) {
        ls.add(usersRes.docs[i].data()['friends'][j]);
      }
      UserModel um = UserModel(
        name: usersRes.docs[i].data()['name'],
        rate: usersRes.docs[i].data()['rate'],
        avatar: usersRes.docs[i].data()['avatar'],
        gamePlayed: usersRes.docs[i].data()['gamePlayed'],
        winRate: usersRes.docs[i].data()['winRate'],
        looseRate: usersRes.docs[i].data()['loseRate'],
        friends: ls,
      );
      lum.add(um);
    }
    List<LobbyViewModel> result = llm.map<LobbyViewModel>(
      (l) {
        return LobbyViewModel(
          id: l.id,
          type: l.type,
          usersNum: l.usersNum,
          maxUserNum: l.maxUserNum,
          users: lum
              .where(
            (m) => (l.users.contains(m.name)),
          )
              .map<UserViewModel>(
            (u) {
              return UserViewModel(
                name: u.name,
                rate: u.rate,
                avatar: u.avatar,
                gamePlayed: u.gamePlayed,
                winRate: u.winRate,
                looseRate: u.looseRate,
              );
            },
          ).toList(),
        );
      },
    ).toList();

    UserViewModel user = await UserController().getUserByName(name);

    LobbiesViewModel ret = LobbiesViewModel(result, user);

    return ret;
  }

  Future<void> createLobby(LobbyModel lm, int newId) async {
    await Firebase.initializeApp();
    FirebaseFirestore.instance
        .collection('lobbies')
        .doc('$newId')
        .set(lm.toMap());
  }
}
