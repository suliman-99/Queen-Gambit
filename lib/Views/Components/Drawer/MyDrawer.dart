import 'package:firebase_auth/firebase_auth.dart';
import 'package:flagfall/Controllers/AuthController.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/MyDivider.dart';
import 'package:flagfall/Views/Pages/History/HistoryPage.dart';
import 'package:flagfall/Views/Pages/LeaderBoard/LeaderBoardPage.dart';
import 'package:flagfall/Views/Pages/LogIn&SignUp/LogInPage.dart';
import 'package:flagfall/Views/Pages/Preferences(Store)/PreferencesPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyDrawerTile.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final AuthController authController = AuthController();
  final UserController userController = UserController();
  Future<UserViewModel> user;
  @override
  void initState() {
    user = userController
        .getUserByName(FirebaseAuth.instance.currentUser.displayName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets\\images\\MyDrawerBackground.png'),
              ),
            ),
          ),
          FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                int tempavatar = snapshot.data.avatar;
                int tempRate = snapshot.data.rate;
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 20,
                          top: MediaQuery.of(context).size.width / 10),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[200],
                        radius: MediaQuery.of(context).size.width / 7,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage(
                                  'assets\\Avatars\\$tempavatar.png'),
                            ),
                          ),
                          height: MediaQuery.of(context).size.height * 0.18,
                          width: MediaQuery.of(context).size.height * 0.18,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 40,
                          left: MediaQuery.of(context).size.width / 20,
                          bottom: MediaQuery.of(context).size.width / 80),
                      child: Text(
                        snapshot.data.name,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width / 20,
                        bottom: MediaQuery.of(context).size.width / 20,
                      ),
                      child: Text('$tempRate'),
                    ),
                    MyDivider(1, Colors.black),
                    MyDrawerTile(
                      Icons.timeline_outlined,
                      "Game Annalysis",
                      () {
                        Get.to(HistoryPage(snapshot.data.name));
                      },
                    ),
                    MyDrawerTile(
                      Icons.leaderboard,
                      "Leaderboard",
                      () {
                        Get.to(LeaderBoardPage());
                      },
                    ),
                    MyDrawerTile(
                      Icons.edit,
                      "Prefrences",
                      () {
                        Get.to(PreferencesPage());
                      },
                    ),
                    MyDrawerTile(
                      Icons.logout_outlined,
                      "Log Out",
                      () async {
                        String response = await authController.logOut();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                          response,
                          textAlign: TextAlign.center,
                        )));
                        Get.to(LogInPage());
                      },
                    ),
                    MyDrawerTile(
                      Icons.info,
                      'About',
                      () {
                        showAboutDialog(
                          context: context,
                        );
                      },
                    ),
                  ],
                );
              } else {
                return Center(child: Text('Loading...'));
              }
            },
          ),
        ],
      ),
    );
  }
}
