import 'package:flagfall/ViewModels/MessageViewModel.dart';

class ChatViewModel {
  int id;
  String name;
  int rate;
  int avatar;
  List<MessageViewModel> messages;
  ChatViewModel({this.id, this.name, this.rate, this.avatar, this.messages});
}
