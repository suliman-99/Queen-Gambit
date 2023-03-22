import 'package:flutter/material.dart';

class MyDrawerTile extends StatelessWidget {
  final IconData i;
  final String s;
  final Function f;

  MyDrawerTile(
    this.i,
    this.s,
    this.f,
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: f,
      child: Padding(
        padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).size.height / 80,
            left: MediaQuery.of(context).size.width / 20,
            right: MediaQuery.of(context).size.width / 20),
        child: Row(
          children: [
            Icon(
              i,
              size: MediaQuery.of(context).size.width / 8,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 20,
            ),
            Text(s),
          ],
        ),
      ),
    );
  }
}
