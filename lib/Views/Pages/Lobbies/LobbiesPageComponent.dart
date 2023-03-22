import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class LobbiesPageComponent extends StatelessWidget {
  final String type;
  final int userNum;
  final int maxUserNum;
  final VoidCallback onPressed;

  const LobbiesPageComponent({
    Key key,
    this.type,
    this.userNum,
    this.onPressed,
    this.maxUserNum,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
      ),
      onPressed: onPressed,
      child: Column(
        children: [
          Text(
            type,
            style: TextStyle(fontSize: 18),
          ),
          Row(
            children: [Icon(EvaIcons.person), Text('$userNum / $maxUserNum')],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          LinearPercentIndicator(
            backgroundColor: Theme.of(context).accentColor,
            percent: userNum / maxUserNum,
            progressColor: Theme.of(context).primaryColor,
          ),
        ],
      ),
    );
  }
}
