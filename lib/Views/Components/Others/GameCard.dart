import 'package:flagfall/ViewModels/GameViewModel.dart';
import 'package:flagfall/Views/Components/Others/HistoryPlayerTile.dart';
import 'package:flagfall/Views/Pages/Games/AnalysisPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GameCard extends StatelessWidget {
  const GameCard({
    Key key,
    this.game,
  }) : super(key: key);

  final GameViewModel game;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(AnalysisPage());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.25,
        width: MediaQuery.of(context).size.width * 0.98,
        child: Card(
          color: Color(0xc0ffffff),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              HistoryPlayerTile(
                name: game.user1,
                rate: game.user1rateChange,
                goodMoves: game.user1goodMoves,
                avatar: game.user1avatar,
              ),
              Text(
                game.user1result,
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 33,
                  fontWeight: FontWeight.bold,
                ),
              ),
              HistoryPlayerTile(
                name: game.user2,
                rate: game.user2rateChange,
                goodMoves: game.user2goodMoves,
                avatar: game.user2avatar,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
