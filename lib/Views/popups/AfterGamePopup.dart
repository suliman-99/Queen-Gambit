import 'package:flagfall/Views/Components/Others/GameTypeButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';

class AfterGamePopup extends StatelessWidget {
  final String wainnerColor;

  const AfterGamePopup(this.wainnerColor);
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.25,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Text('Game Result', style: TextStyle(fontSize: 18)),
            ),
            Divider(color: Colors.purple),
            Text(wainnerColor, style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            GameTypeButton(
              'Ok',
              '',
              () {
                Get.back();
              },
              7,
            )
          ],
        ),
      ),
    );
  }
}
