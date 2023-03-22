import 'package:flagfall/Controllers/UserController.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flutter/material.dart';
import 'LeaderBoardItem.dart';

class LeaderBoardPage extends StatefulWidget {
  @override
  _LeaderBoardPageState createState() => _LeaderBoardPageState();
}

class _LeaderBoardPageState extends State<LeaderBoardPage> {
  final UserController userController = UserController();
  Future<List<UserViewModel>> futureLeaders;

  @override
  void initState() {
    futureLeaders = userController.getLeaderBoard();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Leaderboard'),
      ),
      body: FutureBuilder(
        future: futureLeaders,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) => LeaderBoardItem(
                rank: index + 1,
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
    );
  }
}
