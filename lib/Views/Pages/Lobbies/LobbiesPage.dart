import 'package:flagfall/Controllers/LobbyController.dart';
import 'package:flagfall/ViewModels/LobbyViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Components/Others/MyTopAppbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CreateLobbyButton.dart';
import 'LobbiesPageComponent.dart';
import 'LobbyPage.dart';

class LobbiesPage extends StatefulWidget {
  final String name;

  const LobbiesPage(this.name);
  @override
  _LobbiesPageState createState() => _LobbiesPageState(name);
}

class _LobbiesPageState extends State<LobbiesPage> {
  final String name;
  final LobbyController lobbyController = LobbyController();
  Future<LobbiesViewModel> futureLobbies;

  _LobbiesPageState(this.name);

  @override
  void initState() {
    futureLobbies = lobbyController.getLobbies(name);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureLobbies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: MyTopAppBar(
              title: 'Lobbies',
              actions: [],
            ),
            floatingActionButton: CreateLobbyButton(
              snapshot.data.lvm.length + 1,
            ),
            body: Stack(
              children: [
                Background(image: 'assets\\images\\LobbiesBackground.png'),
                Container(
                  height: MediaQuery.of(context).size.height * 0.8,
                  child: GridView.builder(
                    padding: const EdgeInsets.all(17),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        mainAxisExtent:
                            MediaQuery.of(context).size.height * 0.1,
                        crossAxisCount: 2,
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 40),
                    itemCount: snapshot.data.lvm.length,
                    itemBuilder: (BuildContext context, int index) =>
                        LobbiesPageComponent(
                      type: snapshot.data.lvm[index].type,
                      userNum: snapshot.data.lvm[index].usersNum,
                      maxUserNum: snapshot.data.lvm[index].maxUserNum,
                      onPressed: () {
                        LobbyViewModel lobby = LobbyViewModel(
                          id: snapshot.data.lvm[index].id,
                          type: snapshot.data.lvm[index].type,
                          usersNum: snapshot.data.lvm[index].usersNum,
                          maxUserNum: snapshot.data.lvm[index].maxUserNum,
                          users: snapshot.data.lvm[index].users,
                        );
                        lobby.users.add(snapshot.data.uvm);
                        Get.to(LobbyPage(
                          lobby,
                        ));
                      },
                    ),
                  ),
                ),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: MyTopAppBar(
              title: 'Lobbies',
              actions: [],
            ),
            body: Stack(children: [
              Background(image: 'assets\\images\\LobbiesBackground.png'),
              Center(
                child: Text('Loading...'),
              ),
            ]),
          );
        }
      },
    );
  }
}
