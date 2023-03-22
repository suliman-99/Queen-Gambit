import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final String image;

  const Background({Key key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Image.asset(
        image,
        fit: BoxFit.fill,
      ),
    );
  }
}
