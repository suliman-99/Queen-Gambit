import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Models/UserModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:flagfall/Views/Components/Bottons/MyImageBotton.dart';
import 'package:flagfall/Views/Components/Drawer/MyDrawer.dart';
import 'package:flagfall/Views/Pages/Games/GamePage.dart';
import 'package:flagfall/Views/Pages/Games/OfflineGamePage.dart';
import 'package:flagfall/Views/Pages/Games/PuzzlePage.dart';
import 'package:flagfall/Views/Pages/Lobbies/LobbiesPage.dart';
import 'package:flagfall/Views/Pages/Profiles/ForeignProfilePage.dart';
import 'package:flagfall/Views/popups/CreateGamePopup.dart';
import 'package:flagfall/Views/popups/SearchPopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Home Page'),
        backgroundColor: Colors.purple[700],
      ),
      drawer: MyDrawer(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MyImageBotton(
              () {
                Get.to(
                    LobbiesPage(FirebaseAuth.instance.currentUser.displayName));
              },
              'assets\\images\\HomePageComponentTournament.png',
              MediaQuery.of(context).size.height / 8,
              MediaQuery.of(context).size.width / 1.15,
            ),
            MyImageBotton(
              () async {
                await Firebase.initializeApp();
                List<UserViewModel> users = await UserController().getUsers();
                String gameId;
                bool isWhite;
                var myGame = await FirebaseFirestore.instance
                    .collection('games')
                    .where('blackPlayer', isEqualTo: '')
                    .get();
                if (myGame.docs == null || myGame.docs.isEmpty) {
                  await FirebaseFirestore.instance
                      .collection('games')
                      .doc()
                      .set({
                    'whitePlayer':
                        FirebaseAuth.instance.currentUser.displayName,
                    'blackPlayer': '',
                    'gamePGN': '',
                  });
                  var temp = await FirebaseFirestore.instance
                      .collection('games')
                      .where('whitePlayer',
                          isEqualTo:
                              FirebaseAuth.instance.currentUser.displayName)
                      .get();
                  gameId = temp.docs.first.id;
                  isWhite = true;
                } else {
                  gameId = myGame.docs.first.id;
                  isWhite = false;
                  await FirebaseFirestore.instance
                      .collection('games')
                      .doc(gameId)
                      .set({
                    'whitePlayer': myGame.docs.first.data()['whitePlayer'],
                    'blackPlayer':
                        FirebaseAuth.instance.currentUser.displayName,
                    'gamePGN': '',
                  });
                }
                showDialog(
                  context: context,
                  builder: (context) => CreateGamePopup(
                    users,
                    gameId,
                    isWhite,
                  ),
                );
              },
              'assets\\images\\HomePageComponentRandom.png',
              MediaQuery.of(context).size.height / 8,
              MediaQuery.of(context).size.width / 1.15,
            ),
            MyImageBotton(
              () {
                showDialog(
                  context: context,
                  builder: (context) => SearchPopup(
                    function: (String name) {
                      Get.off(ForeignProfilePage(name));
                    },
                  ),
                );
              },
              'assets\\images\\HomePageComponentSearch.png',
              MediaQuery.of(context).size.height / 8,
              MediaQuery.of(context).size.width / 1.15,
            ),
            MyImageBotton(
              () {
                // UserController().setUser(UserModel(
                //   name: 'test',
                //   rate: 0,
                //   avatar: 0,
                //   gamePlayed: 0,
                //   winRate: 0,
                //   looseRate: 0,
                //   friends: [],
                // ));
                // UserController().addFriend('test', 'Fadi Futainah');
                Get.to(OfflineGamePage2());
              },
              'assets\\images\\HomePageComponentBot.png',
              MediaQuery.of(context).size.height / 8,
              MediaQuery.of(context).size.width / 1.15,
            ),
            MyImageBotton(
              () {
                Get.to(OfflineGamePage());
              },
              'assets\\images\\HomePageComponentOfflineMatch.png',
              MediaQuery.of(context).size.height / 8,
              MediaQuery.of(context).size.width / 1.15,
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(4),
    );
  }
}
