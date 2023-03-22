import 'package:flutter/material.dart';

class MyChessBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Column(
            children: [
              Container(
                color: Colors.pink[300],
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.black26,
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.pink[300],
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.black26,
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.pink[300],
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.black26,
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.pink[300],
                child: Icon(Icons.home_sharp),
              ),
              Container(
                color: Colors.black26,
                child: Icon(Icons.home_sharp),
              ),
            ],
          )
        ],
      ),
    );
  }
}
