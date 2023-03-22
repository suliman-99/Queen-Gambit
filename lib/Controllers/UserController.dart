import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Models/UserModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';

class UserController {
  Future<List<UserViewModel>> getUsers() async {
    await Firebase.initializeApp();

    var response = await FirebaseFirestore.instance.collection('users').get();
    List<UserViewModel> users = response.docs
        .map<UserViewModel>(
          (e) => UserViewModel(
            name: e.data()['name'],
            rate: e.data()['rate'],
            avatar: e.data()['avatar'],
            gamePlayed: e.data()['gamePlayed'],
            winRate: e.data()['winRate'],
            looseRate: e.data()['loseRate'],
          ),
        )
        .toList();
    return users;
  }

  Future<List<UserViewModel>> getLeaderBoard() async {
    await Firebase.initializeApp();

    var response = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('rate', descending: true)
        .get();
    List<UserViewModel> users = response.docs
        .map<UserViewModel>(
          (e) => UserViewModel(
            name: e.data()['name'],
            rate: e.data()['rate'],
            avatar: e.data()['avatar'],
            gamePlayed: e.data()['gamePlayed'],
            winRate: e.data()['winRate'],
            looseRate: e.data()['loseRate'],
          ),
        )
        .toList();
    return getTopTen(users);
  }

  Future<UserViewModel> getUserByName(String name) async {
    await Firebase.initializeApp();

    var response = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: name)
        .get();
    UserModel tempUser = UserModel.fromMap(response.docs.first.data());
    return UserViewModel(
      name: tempUser.name,
      rate: tempUser.rate,
      avatar: tempUser.avatar,
      gamePlayed: tempUser.gamePlayed,
      winRate: tempUser.winRate,
      looseRate: tempUser.looseRate,
    );
  }

  List<UserViewModel> getTopTen(List<UserViewModel> users) {
    List<UserViewModel> ret = [];
    for (var i = 0; i < users.length && i < 10; i++) {
      ret.add(users[i]);
    }
    return ret;
  }

  Future<List<UserViewModel>> getFriends(String name) async {
    await Firebase.initializeApp();
    var usersresponse = await FirebaseFirestore.instance
        .collection('users')
        .orderBy('name', descending: false)
        .get();
    var user =
        await FirebaseFirestore.instance.collection('users').doc(name).get();
    List<UserViewModel> friends = usersresponse.docs
        .where((el) {
          List<dynamic> sfriends = user.data()['friends'];
          return sfriends.contains(el.data()['name']);
        })
        .map<UserViewModel>(
          (e) => UserViewModel(
            name: e.data()['name'],
            rate: e.data()['rate'],
            avatar: e.data()['avatar'],
            gamePlayed: e.data()['gamePlayed'],
            winRate: e.data()['winRate'],
            looseRate: e.data()['loseRate'],
          ),
        )
        .toList();
    return friends;
  }

  Future<List<UserViewModel>> searchByName(String search) async {
    await Firebase.initializeApp();

    var response = await FirebaseFirestore.instance
        .collection('users')
        .where('name', isEqualTo: search)
        .get();
    List<UserModel> users = [];
    List<UserViewModel> result = [];
    for (var item in response.docs) {
      users.add(UserModel.fromMap(item.data()));
    }

    for (var item in users) {
      result.add(UserViewModel(
        name: item.name,
        rate: item.rate,
        avatar: item.avatar,
        gamePlayed: item.gamePlayed,
        winRate: item.winRate,
        looseRate: item.looseRate,
      ));
    }
    return result;
  }

  Future<void> setUser(UserModel user) async {
    await Firebase.initializeApp();
    await FirebaseFirestore.instance.collection('users').doc(user.name).set({
      'name': user.name,
      'rate': user.rate,
      'avatar': user.avatar,
      'gamePlayed': user.gamePlayed,
      'winRate': user.winRate,
      'loseRate': user.looseRate,
      'friends': [],
    });
  }

  Future<void> addFriend(String myName, String friendName) async {
    await Firebase.initializeApp();

    var tempUser =
        await FirebaseFirestore.instance.collection('users').doc(myName).get();
    print(tempUser);
    print(tempUser.data());
    print(friendName);
    print(myName);
    UserModel user = UserModel.fromMap(tempUser.data());
    print('========' + user.friends.toString());
    List<String> l = [];
    l.addAll(user.friends);
    l.add(friendName);
    await FirebaseFirestore.instance.collection('users').doc(myName).update({
      'name': user.name,
      'rate': user.rate,
      'avatar': user.avatar,
      'gamePlayed': user.gamePlayed,
      'winRate': user.winRate,
      'loseRate': user.looseRate,
      'friends': l,
    });
  }
}
