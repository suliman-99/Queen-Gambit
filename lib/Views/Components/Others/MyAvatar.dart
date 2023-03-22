import 'package:flutter/material.dart';

class MyAvatar extends StatelessWidget {
  final int img;

  const MyAvatar(this.img);

  @override
  Widget build(BuildContext context) {
    return (img <= 15 && img > 0)
        ? Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets\\Avatars\\$img.png'),
              ),
            ),
            height: MediaQuery.of(context).size.height * 0.18,
            width: MediaQuery.of(context).size.height * 0.18,
          )
        : Icon(
            Icons.person,
            size: 45,
            color: Theme.of(context).primaryColor,
          );
  }
}
