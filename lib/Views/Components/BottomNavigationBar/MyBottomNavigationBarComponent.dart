import 'package:flutter/material.dart';

class MyBottomNavigationBarComponent extends StatelessWidget {
  const MyBottomNavigationBarComponent(this.idx, this.temp, this.f, this.icon);

  final int idx;
  final int temp;
  final Function f;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: (temp == idx) ? Colors.purple[700] : Colors.white,
      radius: MediaQuery.of(context).size.width / 12,
      child: GestureDetector(
        child: Icon(
          icon,
          color: (temp == idx) ? Colors.grey[200] : Colors.grey[600],
          size: MediaQuery.of(context).size.width / 8,
        ),
        onTap: (temp == idx) ? () {} : f,
      ),
    );
  }
}
