import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/ChatViewModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Bottons/MyColorBotton.dart';
import 'package:flagfall/Views/Components/Others/AppBarContainer.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/Chats/OneChatPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AvatarCard.dart';
import 'MyHistoryBotton.dart';
import 'ProfileAboutDialog.dart';

class ForeignProfilePage extends StatefulWidget {
  final String name;

  const ForeignProfilePage(this.name);

  @override
  _ForeignProfilePageState createState() => _ForeignProfilePageState(name);
}

class _ForeignProfilePageState extends State<ForeignProfilePage> {
  final UserController userController = UserController();
  Future<UserViewModel> user;
  final String name;

  _ForeignProfilePageState(this.name);
  @override
  void initState() {
    user = userController.getUserByName(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.settings),
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Stack(
        children: [
          Background(image: 'assets\\images\\ForeignProfileBackGround.png'),
          AppBarContainer(),
          Center(
            child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AvatarCard(
                        snapshot.data.avatar,
                        snapshot.data.name,
                        snapshot.data.rate,
                      ),
                      ProfileAboutDialog(
                        snapshot.data.gamePlayed,
                        snapshot.data.winRate,
                        snapshot.data.looseRate,
                      ),
                      MyHistoryBotton(snapshot.data.name),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          MyColorBotton(
                            () async {
                              UserViewModel chatUser =
                                  await userController.getUserByName(name);
                              Get.to(OneChatPage(ChatViewModel(
                                name: chatUser.name,
                                rate: chatUser.rate,
                                avatar: chatUser.avatar,
                                messages: [],
                              )));
                            },
                            Colors.purple[700],
                            'Chat',
                            MediaQuery.of(context).size.height / 15,
                            MediaQuery.of(context).size.width / 2.5,
                          ),
                          MyColorBotton(
                            () {
                              userController.addFriend(
                                  FirebaseAuth.instance.currentUser.displayName,
                                  name);
                            },
                            Colors.purple[700],
                            'Follow',
                            MediaQuery.of(context).size.height / 15,
                            MediaQuery.of(context).size.width / 2.5,
                          ),
                        ],
                      ),
                      // MyImageBotton(
                      //   () {
                      //     // Navigator.of(context).pushNamed()
                      //   },
                      //   'assets\\images\\ForeignProfileComponentChallenge.png',
                      //   MediaQuery.of(context).size.height / 12,
                      //   MediaQuery.of(context).size.width / 1.05,
                      // ),
                    ],
                  );
                } else {
                  return Center(child: Text('Loading...'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
