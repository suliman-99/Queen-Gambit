import 'package:flutter/material.dart';

class GameTypeButton extends StatelessWidget {
  GameTypeButton(
    this.gameType,
    this.gameTime,
    this.function,
    this.dist,
  );

  final String gameType;
  final String gameTime;
  final Function function;
  final double dist;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(Size.fromHeight(10)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
      ),
      onPressed: function,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: dist),
            child: Flexible(
              child: Text(
                gameType,
                style: TextStyle(fontSize: 14),
                maxLines: 1,
                softWrap: false,
              ),
            ),
          ),
          Flexible(
            child: Text(
              gameTime,
              style: TextStyle(fontSize: 12),
              maxLines: 1,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
