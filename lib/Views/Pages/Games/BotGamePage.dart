import 'package:flagfall/Chess_Logic/flutter_chess_board.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/Games/GameAppBar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'GameBottomBar.dart';
import 'MyChessBoard.dart';

class BotGamePage extends StatefulWidget {
  final ChessBoardController chessBoardController = ChessBoardController();
  @override
  _BotGamePageState createState() => _BotGamePageState(true);
}

class _BotGamePageState extends State<BotGamePage> {
  bool whiteSide;

  _BotGamePageState(this.whiteSide);

  void flipTheBoard() {
    setState(() {
      whiteSide = !whiteSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GameAppBar2(
        height: MediaQuery.of(context).size.height * 0.22,
        imgheight: MediaQuery.of(context).size.height * 0.10,
        imgwidth: MediaQuery.of(context).size.width,
      ),
      bottomNavigationBar: GameBottomBar(
        [
          IconNFunction(Icons.flag_outlined, () {}),
          IconNFunction(Icons.campaign, () {}),
          IconNFunction(Icons.wifi_protected_setup, () {
            flipTheBoard();
          }),
          IconNFunction(Icons.arrow_back_rounded, () {}),
          IconNFunction(Icons.arrow_forward_rounded, () {}),
        ],
        // '',
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Background(
              image: 'assets\\images\\GameBoard.png',
            ),
          ),
          Positioned(
            child: Text(
              '1:10',
              style: TextStyle(color: Colors.grey, fontSize: 18),
            ),
            top: MediaQuery.of(context).size.height / 37,
            right: MediaQuery.of(context).size.width / 4.5,
          ),
          Positioned(
            child: Text(
              '1:10',
              style: TextStyle(color: Colors.brown, fontSize: 18),
            ),
            bottom: MediaQuery.of(context).size.height / 35,
            left: MediaQuery.of(context).size.width / 4.5,
          ),
          Padding(
            padding:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 11.5),
            child: Container(
              height: MediaQuery.of(context).size.width,
              width: MediaQuery.of(context).size.width,
              // child: MyChessBoard(widget.chessBoardController, true),
            ),
          ),
        ],
      ),
    );
  }
}

// class MyChessBoard extends StatelessWidget {
//   final bool whiteSide;
//   final ChessBoardController chessBoardController;
//   const MyChessBoard(this.chessBoardController, this.whiteSide);

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<Object>(
//         stream:
//             FirebaseFirestore.instance.collection('games').doc('1').snapshots(),
//         builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
//           if (snapshot.hasData) {
//             chessBoardController.game.load_pgn(snapshot.data['gamePGN']);
//             print(chessBoardController.game.pgn());
//             return ChessBoard(
//               chessBoardController: chessBoardController,
//               whiteSideTowardsUser: whiteSide,
//               onMove: (move) {
//                 print('this is the pgn ' + chessBoardController.game.pgn());
//                 FirebaseFirestore.instance.collection('games').doc('1').set({
//                   'gamePGN': move,
//                 });
//               },
//               onCheck: (color) {
//                 print(color);
//               },
//               onCheckMate: (color) {
//                 showDialog(
//                   context: context,
//                   builder: (ctx) {
//                     return AfterGamePopup(pieceColorString(color) + ' Win');
//                   },
//                 );
//               },
//               onDraw: () {},
//               size: MediaQuery.of(context).size.width,
//               enableUserMoves: true,
//             );
//           } else {
//             return Center(child: Text('Loading...'));
//           }
//         });
//   }
// }
