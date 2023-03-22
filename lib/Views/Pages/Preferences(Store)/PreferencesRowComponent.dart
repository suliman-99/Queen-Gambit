import 'package:flagfall/ViewModels/ThemeViewModel.dart';
import 'package:flagfall/Views/Components/Bottons/MyImageBotton.dart';
import 'package:flutter/material.dart';

class PreferencesRowComponent extends StatelessWidget {
  const PreferencesRowComponent(
    this.myData,
  );

  final ThemeViewModel myData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          MyImageBotton(
            () {},
            myData.img,
            MediaQuery.of(context).size.height / 5.8,
            MediaQuery.of(context).size.width / 3.5,
          ),
          Text(
            myData.title,
            style: TextStyle(
              color: Color(0xff888888),
            ),
          )
        ],
      ),
    );
  }
}
