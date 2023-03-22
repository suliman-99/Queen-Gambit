import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/Views/Components/Others/MyDivider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconNFunction {
  final IconData icon;
  final Function function;

  IconNFunction(this.icon, this.function);
}

class GameBottomBar extends StatefulWidget {
  final List<IconNFunction> iconNFunction;

  const GameBottomBar(this.iconNFunction);

  @override
  _GameBottomBarState createState() => _GameBottomBarState();
}

class _GameBottomBarState extends State<GameBottomBar> {
  @override
  Widget build(BuildContext context) {
    final String gamePGN =
        Provider.of<OfflineGameProvider>(context).currentGamePGN;

    return BottomAppBar(
      // child: Container(
      //   decoration: BoxDecoration(
      //     gradient: LinearGradient(
      //       begin: Alignment.centerLeft,
      //       end: Alignment.centerRight,
      //       colors: [Color(0xffe3c0d3), Color(0xff662d91)],
      //     ),
      //   ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.purple[700],
        ),
        height: MediaQuery.of(context).size.height / 9,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  gamePGN,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white),
                ),
              ),
              scrollDirection: Axis.horizontal,
            ),
            MyDivider(2, Colors.black),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: widget.iconNFunction
                  .map(
                    (data) => IconButton(
                      onPressed: data.function,
                      icon: Icon(
                        data.icon,
                        color: Colors.white,
                        size: MediaQuery.of(context).size.height / 14,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      // ),
    );
  }
}
