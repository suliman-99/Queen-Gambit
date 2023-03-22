import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flagfall/Chess_Logic/flutter_chess_board.dart';
import 'package:flagfall/Views/popups/AfterGamePopup.dart';
import 'package:flutter/material.dart';
import 'OfflineGamePage.dart';

class MyChessBoard extends StatelessWidget {
  final gameId;
  final bool isWhite;
  bool canMove;
  final ChessBoardController chessBoardController;
  MyChessBoard(this.gameId, this.chessBoardController, this.isWhite) {
    canMove = isWhite;
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Object>(
      stream: FirebaseFirestore.instance
          .collection('games')
          .doc(gameId)
          .snapshots(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data['blackPlayer'] == '') {
            return Center(
              child: Container(
                height: 70,
                width: 70,
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey[500],
                  strokeWidth: 15,
                ),
              ),
            );
          } else {
            if (!canMove) {
              canMove = true;
            }
            chessBoardController.game.load_pgn(snapshot.data['gamePGN']);
            return ChessBoard(
              chessBoardController: chessBoardController,
              whiteSideTowardsUser: isWhite,
              onMove: (move) {
                (snapshot.data as DocumentSnapshot)
                    .reference
                    .update({'gamePGN': chessBoardController.game.pgn()});
                canMove = !canMove;
              },
              onCheck: (color) {},
              onCheckMate: (color) {
                showDialog(
                  context: context,
                  builder: (ctx) {
                    return AfterGamePopup(pieceColorString(color) + ' Win');
                  },
                );
              },
              onDraw: () {},
              size: MediaQuery.of(context).size.width,
              enableUserMoves: canMove,
            );
          }
        } else {
          return Center(child: Text('Loading...'));
        }
      },
    );
  }
}
