import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MySlider extends StatefulWidget {
  final int maxPlayers;

  const MySlider(this.maxPlayers);
  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  double particapantsNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Slider(
      min: 1,
      max: widget.maxPlayers.toDouble(),
      value: particapantsNumber,
      divisions: widget.maxPlayers,
      label: '${particapantsNumber.toInt()}',
      onChanged: (double value) {
        setState(() {
          particapantsNumber = value;
          Provider.of<OfflineGameProvider>(context, listen: false)
              .updateCreatLobbyUsersNum(value.toInt());
        });
      },
    );
  }
}
