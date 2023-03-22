import 'package:flutter/material.dart';

class AppBarContainer extends StatelessWidget {
  const AppBarContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: Container(
        color: Theme.of(context).primaryColor,
        height: MediaQuery.of(context).size.height * 0.12,
      ),
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(70),
        bottomRight: Radius.circular(70),
      ),
    );
  }
}
