import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flutter/material.dart';

class OfflineGameProvider extends ChangeNotifier {
  String currentGamePGN = '';
  int creatLobbyUsersNum = 1;
  UserViewModel user = UserViewModel(
    name: 'User Name',
    rate: 0,
    avatar: 0,
    gamePlayed: 0,
    winRate: 0,
    looseRate: 0,
  );
  List<UserViewModel> searchResult = [];

  void updatePGN(String pgn) {
    this.currentGamePGN = pgn;
    notifyListeners();
  }

  void updateCreatLobbyUsersNum(int n) {
    this.creatLobbyUsersNum = n;
    notifyListeners();
  }

  void updateUser(UserViewModel u) {
    this.user = u;
    notifyListeners();
  }

  void updateSearchResult(List<UserViewModel> result) {
    this.searchResult = result;
    notifyListeners();
  }
}
