import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/UserTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class GameAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double imgheight;
  final double imgwidth;
  final double height;
  final UserViewModel user;
  GameAppBar({
    Key key,
    this.imgheight,
    this.imgwidth,
    this.height,
    this.user,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 12,
            top: MediaQuery.of(context).size.height / 13),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets\\images\\logo.png'),
              height: imgheight,
              width: imgwidth,
              fit: BoxFit.fitHeight,
            ),
            UserTile(
              user: UserViewModel(
                name: user.name,
                rate: user.rate,
                avatar: user.avatar,
                gamePlayed: user.gamePlayed,
                winRate: user.winRate,
                looseRate: user.looseRate,
              ),
              color: Colors.cyan[100],
              fColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class GameAppBar2 extends StatelessWidget implements PreferredSizeWidget {
  final double imgheight;
  final double imgwidth;
  final double height;
  GameAppBar2({
    Key key,
    this.imgheight,
    this.imgwidth,
    this.height,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          Provider.of<OfflineGameProvider>(context, listen: false)
              .updatePGN('');
          Get.back();
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 12,
            top: MediaQuery.of(context).size.height / 13),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets\\images\\logo.png'),
              height: imgheight * 1.5,
              width: imgwidth * 1.5,
              fit: BoxFit.fitHeight,
            ),
          ],
        ),
      ),
    );
  }
}

class GameAppBar3 extends StatelessWidget implements PreferredSizeWidget {
  final double imgheight;
  final double imgwidth;
  final double height;
  final UserViewModel user;
  final Function f;
  GameAppBar3({
    Key key,
    this.imgheight,
    this.imgwidth,
    this.height,
    this.user,
    this.f,
  }) : super(key: key);
  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          1.seconds.delay(f);
          Get.back();
        },
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
      flexibleSpace: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 15,
            top: MediaQuery.of(context).size.height / 15),
        child: Column(
          children: [
            Image(
              image: AssetImage('assets\\images\\logo.png'),
              height: imgheight,
              width: imgwidth,
              fit: BoxFit.fitHeight,
            ),
            UserTile(
              user: UserViewModel(
                name: user.name,
                rate: user.rate,
                avatar: user.avatar,
                gamePlayed: user.gamePlayed,
                winRate: user.winRate,
                looseRate: user.looseRate,
              ),
              color: Colors.cyan[100],
              fColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
