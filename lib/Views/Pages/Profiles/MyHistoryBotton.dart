import 'package:flagfall/Views/Pages/History/HistoryPage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyHistoryBotton extends StatelessWidget {
  final String name;

  const MyHistoryBotton(this.name);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(HistoryPage(name));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: Card(
          color: Color(0xe0ffffff),
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.history_sharp,
                  color: Theme.of(context).primaryColor,
                  size: 50,
                ),
              ),
              Text(
                'History',
                style: TextStyle(fontSize: 25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
