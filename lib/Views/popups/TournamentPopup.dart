import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Controllers/LobbyController.dart';
import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/Models/LobbyModel.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/LobbyViewModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Pages/Lobbies/LobbyPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../Components/Others/GameTypeButton.dart';
import 'MySlider.dart';

class TournamentPopup extends StatelessWidget {
  final int newId;

  const TournamentPopup(this.newId);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.55,
        child: Column(
          children: [
            Expanded(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  'Select Game Type',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
            Expanded(
              child: Divider(color: Colors.purple),
              flex: 1,
            ),
            Expanded(
              flex: 70,
              child: GridView(
                padding: EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6,
                  mainAxisSpacing: 6,
                ),
                children: [
                  GameTypeButton(
                    'Bullet',
                    '1 + 0',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Bullet',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Bullet',
                    '1 + 1',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Bullet',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '3 + 0',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Blitz',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '3 + 2',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Blitz',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '5 + 0',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Blitz',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Rapid',
                    '10 + 0',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Rapid',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Rapid',
                    '15 + 15',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Rapid',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Classic',
                    '15 + 15',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Classic',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Classic',
                    '30 + 0',
                    () async {
                      await Firebase.initializeApp();
                      UserController userController = UserController();
                      UserViewModel u = await userController.getUserByName(
                          FirebaseAuth.instance.currentUser.displayName);
                      await LobbyController().createLobby(
                        LobbyModel(
                            id: newId,
                            type: 'Classic',
                            maxUserNum: Provider.of<OfflineGameProvider>(
                                    context,
                                    listen: false)
                                .creatLobbyUsersNum,
                            usersNum: 1,
                            users: [u.name]),
                        newId,
                      );
                      Get.off(
                          LobbyPage(LobbyViewModel(usersNum: 1, users: [u])));
                    },
                    0,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Text(
                'number of participants',
                style: TextStyle(
                    fontSize: 16, color: Theme.of(context).primaryColor),
              ),
            ),
            Expanded(
              flex: 10,
              child: MySlider(64),
            ),
          ],
        ),
      ),
    );
  }
}
