import 'package:flutter/material.dart';

class MyColorBotton extends StatelessWidget {
  final Function f;
  final Color color;
  final String txt;
  final double height;
  final double width;

  MyColorBotton(this.f, this.color, this.txt, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: height,
        width: width,
        child: Center(
          child: Text(
            txt,
            style: TextStyle(
              color: Colors.grey[400],
              fontSize: 25,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
      ),
      onTap: f,
    );
  }
}
