import 'package:chess/chess.dart' as chess;
import 'package:flagfall/Chess_Logic/flutter_chess_board.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/Games/GameAppBar.dart';
import 'package:flagfall/Views/popups/AfterGamePopup.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GameBottomBar.dart';

class OfflineGamePage extends StatefulWidget {
  @override
  _OfflineGamePageState createState() => _OfflineGamePageState();
}

class _OfflineGamePageState extends State<OfflineGamePage> {
  bool whiteSide = true;
  ChessBoardController chessBoardController = ChessBoardController();

  void flipTheBoard() {
    setState(() {
      whiteSide = !whiteSide;
    });
  }

  @override
  Widget build(BuildContext context) {
    chessBoardController.game = chess.Chess();

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
        // chessBoardController.game.pgn().toString(),
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
              child: ChessBoard(
                chessBoardController: chessBoardController,
                whiteSideTowardsUser: whiteSide,
                onMove: (move) {
                  Provider.of<OfflineGameProvider>(context, listen: false)
                      .updatePGN(chessBoardController.game.pgn());
                  print(move);
                },
                onCheck: (color) {
                  print(color);
                },
                onCheckMate: (color) {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AfterGamePopup(pieceColorString(color) + ' Win');
                    },
                  );
                },
                onDraw: () {
                  showDialog(
                    context: context,
                    builder: (ctx) {
                      return AfterGamePopup(' Draw ');
                    },
                  );
                },
                size: MediaQuery.of(context).size.width,
                enableUserMoves: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

String pieceColorString(PieceColor color) {
  if (color != PieceColor.White) {
    return 'White';
  } else {
    return 'Black';
  }
}
