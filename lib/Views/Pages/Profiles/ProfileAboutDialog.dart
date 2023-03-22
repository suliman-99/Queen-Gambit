import 'package:flutter/material.dart';

class ProfileAboutDialog extends StatelessWidget {
  final int gamePlayed;
  final int winRate;
  final int looseRate;

  const ProfileAboutDialog(this.gamePlayed, this.winRate, this.looseRate);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      width: MediaQuery.of(context).size.width * 0.9,
      child: Card(
        color: Color(0xe0ffffff),
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(35),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 7),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'About',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Text('Games Played'),
                      Text('Winning Rate'),
                      Text('Loose Rate'),
                      SizedBox(height: 15),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.2,
                  ),
                  Column(
                    children: [
                      Text('$gamePlayed'),
                      Text('$winRate%'),
                      Text('$looseRate%'),
                      SizedBox(
                        height: 15,
                      ),
                    ],
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
