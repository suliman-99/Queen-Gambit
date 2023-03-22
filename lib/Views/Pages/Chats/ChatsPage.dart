import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/ChatViewModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/MyBigAppBar.dart';
import 'package:flagfall/Views/Pages/Chats/OneChatPage.dart';
import 'package:flagfall/Views/Pages/LeaderBoard/LeaderBoardItem.dart';
import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flagfall/Views/Components/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:flagfall/Views/Components/Drawer/MyDrawer.dart';
import 'package:flagfall/Views/Components/Others/ListTileItem.dart';
import 'package:get/get.dart';

class ChatsPages extends StatefulWidget {
  @override
  _ChatsPagesState createState() => _ChatsPagesState();
}

class _ChatsPagesState extends State<ChatsPages> {
  final List<ChatViewModel> chats = [
    ChatViewModel(
        messages: [], id: 1, name: 'Fadi Futainah', rate: 3539, avatar: 2),
    ChatViewModel(
        messages: [], id: 1, name: 'Ismaiel Refayee', rate: 2950, avatar: 3),
    ChatViewModel(
        messages: [], id: 1, name: 'Mustafa Kurdi', rate: 2800, avatar: 4),
    ChatViewModel(
        messages: [], id: 1, name: 'Kamel Habib', rate: 2655, avatar: 5),
    ChatViewModel(
        messages: [], id: 1, name: 'Mohammad Haj', rate: 2540, avatar: 6),
    ChatViewModel(
        messages: [], id: 1, name: 'Moayad Makieah', rate: 2300, avatar: 7),
    ChatViewModel(
        messages: [], id: 1, name: 'Osama Horani', rate: 2100, avatar: 8),
    ChatViewModel(
        messages: [], id: 1, name: 'Fareed Naami', rate: 1998, avatar: 9),
    ChatViewModel(
        messages: [], id: 1, name: 'Saeed Koja', rate: 1980, avatar: 10),
    ChatViewModel(
        messages: [], id: 1, name: 'Ismaiel Refayee', rate: 1970, avatar: 11),
    ChatViewModel(
        messages: [], id: 1, name: 'Mustafa Kurdi', rate: 1965, avatar: 12),
    ChatViewModel(
        messages: [], id: 1, name: 'Kamel Habib', rate: 1950, avatar: 13),
    ChatViewModel(
        messages: [], id: 1, name: 'Mohammad Haj', rate: 1900, avatar: 14),
    ChatViewModel(
        messages: [], id: 1, name: 'Moayad Makieah', rate: 1855, avatar: 15),
    ChatViewModel(
        messages: [], id: 1, name: 'Osama Horani', rate: 1700, avatar: 8),
    ChatViewModel(
        messages: [], id: 1, name: 'Fareed Naami', rate: 1690, avatar: 9),
    ChatViewModel(
        messages: [], id: 1, name: 'Saeed Koja', rate: 1650, avatar: 10),
  ];

  final UserController userController = UserController();
  Future<List<UserViewModel>> friends;
  @override
  void initState() {
    friends = userController
        .getFriends(FirebaseAuth.instance.currentUser.displayName);
    print(friends);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        drawer: MyDrawer(),
        appBar: MyBigAppBar2(
          height: MediaQuery.of(context).size.height * 0.2,
          imgheight: MediaQuery.of(context).size.height * 0.15,
          imgwidth: MediaQuery.of(context).size.width * 0.15,
        ),
        bottomNavigationBar: MyBottomNavigationBar(2),
        body: TabBarView(
          children: [
            ListView.builder(
              itemCount: chats.length,
              itemBuilder: (BuildContext context, int index) => GestureDetector(
                onTap: () {
                  Get.to(OneChatPage(chats[index]));
                },
                child: ListTileItem(
                  img: chats[index].avatar,
                  name: chats[index].name,
                  rate: chats[index].rate,
                  trailing: Icon(EvaIcons.messageCircleOutline, size: 40),
                ),
              ),
            ),
            FutureBuilder(
              future: friends,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (BuildContext context, int index) =>
                        LeaderBoardItem(
                      rank: -1,
                      name: snapshot.data[index].name,
                      rate: snapshot.data[index].rate,
                      avatar: snapshot.data[index].avatar,
                    ),
                  );
                } else {
                  return Center(child: Text('Loading...'));
                }
              },
            ),
            Center(child: Text('Loading...')),
          ],
        ),
      ),
    );
  }
}
