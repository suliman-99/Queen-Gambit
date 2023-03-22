import 'package:flagfall/Controllers/GamesController.dart';
import 'package:flagfall/ViewModels/GameViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Components/Others/GameCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/*
don't code her
Ultra trash from the team designer*
*/

class HistoryPage extends StatefulWidget {
  final String name;

  const HistoryPage(this.name);

  @override
  _HistoryPageState createState() => _HistoryPageState(name);
}

class _HistoryPageState extends State<HistoryPage> {
  final GamesController gamesController = GamesController();
  Future<List<GameViewModel>> futureGames;
  final String name;

  _HistoryPageState(this.name);

  @override
  void initState() {
    futureGames = gamesController.getHistoryGamesByName(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Stack(
        children: [
          Background(image: 'assets\\images\\HistoryBackGround.png'),
          FutureBuilder(
            future: futureGames,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) => GameCard(
                    game: snapshot.data[index],
                  ),
                );
              } else {
                return Center(child: Text('Loading...'));
              }
            },
          ),
        ],
      ),
      backgroundColor: Colors.grey[400],
    );
  }
}
