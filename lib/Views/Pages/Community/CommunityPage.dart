import 'package:flagfall/Controllers/ArticleController.dart';
import 'package:flagfall/Controllers/GamesController.dart';
import 'package:flagfall/ViewModels/ArticleViewModel.dart';
import 'package:flagfall/ViewModels/GameViewModel.dart';
import 'package:flagfall/Views/Components/Others/GameCard.dart';
import 'package:flutter/material.dart';
import 'package:flagfall/Views/Components/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:flagfall/Views/Components/Drawer/MyDrawer.dart';
import 'package:flagfall/Views/Components/Others/MyBigAppBar.dart';
import 'ArticleListItem.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  final ArticleController articleController = ArticleController();
  final GamesController gamesController = GamesController();
  Future<List<ArticleViewModel>> futureArticles;
  Future<List<GameViewModel>> futureGames;

  @override
  void initState() {
    futureArticles = articleController.getArticles();
    futureGames = gamesController.getTopGames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.grey[350],
        drawer: MyDrawer(),
        appBar: MyBigAppBar(
          height: MediaQuery.of(context).size.height * 0.2,
          imgheight: MediaQuery.of(context).size.height * 0.15,
          imgwidth: MediaQuery.of(context).size.width * 0.15,
        ),
        bottomNavigationBar: MyBottomNavigationBar(3),
        body: TabBarView(
          children: [
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
            FutureBuilder(
              future: futureArticles,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) => ArticleListItem(
                      articleViewModel: snapshot.data[index],
                    ),
                  );
                } else {
                  return Center(child: Text('Loading...'));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
