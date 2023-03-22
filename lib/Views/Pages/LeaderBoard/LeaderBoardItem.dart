import 'package:flagfall/Views/Components/Others/MyAvatar.dart';
import 'package:flagfall/Views/Pages/Profiles/ForeignProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LeaderBoardItem extends StatelessWidget {
  final int rate;
  final String name;
  final int rank;
  final int avatar;

  const LeaderBoardItem({this.rate, this.name, this.rank, this.avatar});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(ForeignProfilePage(name));
      },
      child: Card(
        child: ListTile(
          leading: SizedBox(
            child: Container(
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Theme.of(context).accentColor,
                child: MyAvatar(avatar),
              ),
            ),
          ),
          title: Text(
            name,
            style: TextStyle(fontSize: 24),
          ),
          subtitle: Text(rate.toString()),
          trailing: (rank == -1)
              ? Text('')
              : Text(
                  '#$rank',
                  style: TextStyle(fontSize: 28),
                ),
        ),
      ),
    );
  }
}
