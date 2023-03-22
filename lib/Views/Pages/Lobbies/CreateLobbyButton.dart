import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flagfall/Views/popups/TournamentPopup.dart';
import 'package:flutter/material.dart';

class CreateLobbyButton extends StatelessWidget {
  final int lobbiesNum;

  const CreateLobbyButton(this.lobbiesNum);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      backgroundColor: Theme.of(context).primaryColor,
      icon: Icon(
        EvaIcons.plus,
        size: 40,
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => TournamentPopup(lobbiesNum),
        );
      },
      label: Row(
        children: [
          Text('Create lobby'),
        ],
      ),
    );
  }
}
