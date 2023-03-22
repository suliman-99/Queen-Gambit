import 'package:flutter/material.dart';

import 'MyAvatar.dart';

class ListTileItem extends StatelessWidget {
  final int rate;
  final String name;
  final Widget trailing;
  final Color backgroundColor;
  final int img;
  const ListTileItem(
      {this.rate, this.name, this.trailing, this.backgroundColor, this.img});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        tileColor: Color(0x90ffffff),
        leading: CircleAvatar(
          radius: 25,
          backgroundColor: Theme.of(context).accentColor,
          child: MyAvatar(img),
        ),
        title: Text(
          name,
          style: TextStyle(fontSize: 24),
        ),
        subtitle: Text(rate.toString()),
        trailing: trailing,
      ),
    );
  }
}
