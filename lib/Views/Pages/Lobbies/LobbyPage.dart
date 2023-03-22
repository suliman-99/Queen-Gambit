import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flagfall/ViewModels/LobbyViewModel.dart';
import 'package:flagfall/Views/Pages/LeaderBoard/LeaderBoardItem.dart';
import 'package:flagfall/Views/popups/SearchPopup.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LobbyPage extends StatefulWidget {
  final LobbyViewModel lobby;

  LobbyPage(this.lobby);

  @override
  _LobbyPageState createState() => _LobbyPageState();
}

class _LobbyPageState extends State<LobbyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //   icon: Icon(EvaIcons.refreshOutline),
          //   onPressed: () {
          //     setState(() {});
          //   },
          //   iconSize: 35,
          // ),
          IconButton(
            icon: Icon(EvaIcons.personAdd),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => SearchPopup(
                  function: (String name) {
                    Get.back();
                  },
                ),
              );
            },
            iconSize: 35,
          ),
        ],
        title: Text('Lobby'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded, size: 35),
          onPressed: () {
            setState(() {
              widget.lobby.users.removeLast();
            });
            0.5.seconds.delay(Get.back);
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          EvaIcons.logOut,
          color: Colors.white,
          size: 40,
        ),
        backgroundColor: Theme.of(context).primaryColor,
        onPressed: () {
          setState(() {
            widget.lobby.users.removeLast();
          });
          0.5.seconds.delay(Get.back);
        },
      ),
      body: ListView.builder(
        itemCount: widget.lobby.users.length,
        itemBuilder: (BuildContext context, int index) => LeaderBoardItem(
          avatar: widget.lobby.users[index].avatar,
          name: widget.lobby.users[index].name,
          rate: widget.lobby.users[index].rate,
          rank: -1,
        ),
      ),
    );
  }
}
