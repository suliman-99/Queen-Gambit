import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:flagfall/Views/Components/Drawer/MyDrawer.dart';
import 'package:flagfall/Views/Components/Others/AppBarContainer.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/Profiles/EditProfile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'AvatarCard.dart';
import 'MyHistoryBotton.dart';
import 'ProfileAboutDialog.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController userController = UserController();
  Future<UserViewModel> user;
  int selected;
  @override
  void initState() {
    user = userController
        .getUserByName(FirebaseAuth.instance.currentUser.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (ctx) {
                      return EditProfile(selected,
                          FirebaseAuth.instance.currentUser.displayName);
                    });
              },
            ),
          )
        ],
        backgroundColor: Theme.of(context).primaryColor,
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          Background(image: 'assets\\images\\ForeignProfileBackGround.png'),
          AppBarContainer(),
          Center(
            child: FutureBuilder(
              future: user,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  selected = snapshot.data.avatar;
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
      bottomNavigationBar: MyBottomNavigationBar(1),
    );
  }
}
