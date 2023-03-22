import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Pages/Profiles/ForeignProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyAvatar.dart';

class UserTile extends StatelessWidget {
  final UserViewModel user;
  final Color color;
  final Color fColor;

  const UserTile({Key key, this.user, this.color, this.fColor});
  @override
  Widget build(BuildContext context) {
    int rate = user.rate;
    return GestureDetector(
      onTap: () {
        Get.to(ForeignProfilePage(user.name));
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: MyAvatar(user.avatar),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(fontSize: 22, color: fColor),
              ),
              Text(
                '$rate',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class UserTile1 extends StatelessWidget {
  final UserViewModel user;
  final Color color;
  final Color fColor;
  final Function(String) f;

  const UserTile1(this.user, this.color, this.fColor, this.f);
  @override
  Widget build(BuildContext context) {
    int rate = user.rate;
    return GestureDetector(
      onTap: () {
        f(user.name);
      },
      child: Row(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: color,
            child: MyAvatar(user.avatar),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(fontSize: 22, color: fColor),
              ),
              Text(
                '$rate',
                style: TextStyle(fontSize: 17, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
