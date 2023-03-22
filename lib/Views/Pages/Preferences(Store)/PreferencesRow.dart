import 'package:flagfall/ViewModels/ThemeViewModel.dart';
import 'package:flutter/material.dart';

import 'PreferencesRowComponent.dart';

class PreferencesRow extends StatelessWidget {
  const PreferencesRow(this.myComponents, this.title);

  final List<ThemeViewModel> myComponents;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xe0ffffff),
      height: MediaQuery.of(context).size.height / 3.8,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text(
              title + ' > ',
              style: TextStyle(fontSize: 20, color: Color(0xff888888)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              height: MediaQuery.of(context).size.height / 4.93,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: myComponents.length,
                  itemBuilder: (BuildContext ctx, int idx) {
                    return PreferencesRowComponent(myComponents[idx]);
                  }),
            ),
          ),
        ],
      ),
    );
  }
}
