import 'package:flutter/material.dart';

import 'MyAvatar.dart';

class HistoryPlayerTile extends StatelessWidget {
  const HistoryPlayerTile({
    Key key,
    this.name,
    this.rate,
    this.goodMoves,
    this.avatar,
  }) : super(key: key);

  final String name;
  final int rate;
  final int goodMoves;
  final int avatar;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Theme.of(context).accentColor,
                  child: MyAvatar(avatar),
                ),
              ),
            ],
          ),
          Text('    $name'),
          Text('    $rate'),
          Text('    good moves : $goodMoves'),
        ],
      ),
    );
  }
}
