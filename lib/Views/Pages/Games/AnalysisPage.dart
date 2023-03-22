import 'package:flagfall/Views/Components/Others/MyTopAppbar.dart';
import 'package:flagfall/Views/Pages/Games/GameBottomBar.dart';
import 'package:flutter/material.dart';

class AnalysisPage extends StatelessWidget {
  const AnalysisPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Image.asset(
        'assets\\images\\AnalysisBackGround.png',
        fit: BoxFit.fill,
      ),
      Scaffold(
        backgroundColor: Color(0x01111111),
        body: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 8),
          child: Image.asset(
            'assets\\images\\AnalysisBoard.png',
            fit: BoxFit.fitWidth,
          ),
        ),
        appBar: MyTopAppBar(
          title: 'Analysis',
        ),
        bottomNavigationBar: GameBottomBar(
          [
            IconNFunction(Icons.wifi_protected_setup, () {}),
            IconNFunction(Icons.arrow_back_rounded, () {}),
            IconNFunction(Icons.arrow_forward_rounded, () {}),
          ],
          // '',
        ),
      ),
    ]);
  }
}
