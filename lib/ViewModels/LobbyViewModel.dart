import 'package:flagfall/ViewModels/UserViewModel.dart';

class LobbyViewModel {
  int id;
  String type;
  int usersNum;
  int maxUserNum;
  List<UserViewModel> users;
  LobbyViewModel(
      {this.id, this.type, this.usersNum, this.maxUserNum, this.users});
}

class LobbiesViewModel {
  final List<LobbyViewModel> lvm;
  final UserViewModel uvm;

  LobbiesViewModel(this.lvm, this.uvm);
}
