import 'package:flutter/material.dart';

class MyImageBotton extends StatelessWidget {
  final Function f;
  final String img;
  final double height;
  final double width;

  MyImageBotton(this.f, this.img, this.height, this.width);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(img),
          ),
        ),
        height: height,
        width: width,
      ),
      onTap: f,
    );
  }
}
