import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final List<Widget> actions;
  final String title;
  const MyTopAppBar({Key key, this.actions, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: actions,
      title: Text(title),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_rounded, size: 35),
        onPressed: () {
          Get.back();
        },
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56);
}
