import 'package:flutter/material.dart';

class MyDivider extends StatelessWidget {
  final double h;
  final Color c;

  MyDivider(this.h, this.c);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: h,
      color: c,
    );
  }
}
