import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flagfall/Views/Pages/Chats/ChatsPage.dart';
import 'package:flagfall/Views/Pages/Community/CommunityPage.dart';
import 'package:flagfall/Views/Pages/HomePage/MyHomePage.dart';
import 'package:flagfall/Views/Pages/Profiles/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'MyBottomNavigationBarComponent.dart';

//done by noob programmer
//needs respoonsive
//line 24 ..etc

class MyBottomNavigationBar extends StatelessWidget {
  final int tempScreen;

  const MyBottomNavigationBar(this.tempScreen);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MyBottomNavigationBarComponent(
            1,
            tempScreen,
            () {
              Get.off(ProfilePage());
            },
            EvaIcons.personOutline,
          ),
          MyBottomNavigationBarComponent(
            2,
            tempScreen,
            () {
              Get.off(ChatsPages());
            },
            EvaIcons.messageCircleOutline,
          ),
          MyBottomNavigationBarComponent(
            3,
            tempScreen,
            () {
              Get.off(CommunityPage());
            },
            EvaIcons.globe2Outline,
          ),
          MyBottomNavigationBarComponent(
            4,
            tempScreen,
            () {
              Get.off(MyHomePage());
            },
            EvaIcons.gridOutline,
          ),
        ],
      ),
    );
  }
}
