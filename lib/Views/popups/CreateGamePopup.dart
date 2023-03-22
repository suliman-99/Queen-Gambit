import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Pages/Games/GamePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Components/Others/GameTypeButton.dart';

class CreateGamePopup extends StatelessWidget {
  final List<UserViewModel> users;
  final String gameId;
  final bool isWhite;

  CreateGamePopup(this.users, this.gameId, this.isWhite);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.45,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                child: Text(
                  'Select Game Type',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              flex: 12,
            ),
            Expanded(
              child: Divider(color: Colors.purple),
              flex: 1,
            ),
            Expanded(
              flex: 87,
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
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Bullet',
                    '1 + 1',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '3 + 0',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '3 + 2',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Blitz',
                    '5 + 0',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Rapid',
                    '10 + 0',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Rapid',
                    '15 + 15',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Classic',
                    '15 + 15',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                  GameTypeButton(
                    'Classic',
                    '30 + 0',
                    () {
                      Get.off(GamePage(users, gameId, isWhite));
                    },
                    0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
