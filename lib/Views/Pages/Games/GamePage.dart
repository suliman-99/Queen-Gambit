import 'package:chess/chess.dart' as chess;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flagfall/Chess_Logic/flutter_chess_board.dart';
import 'package:flagfall/Providers/OfflineGameProvider.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Pages/Games/GameAppBar.dart';
import 'package:flagfall/Views/popups/AfterGamePopup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'GameBottomBar.dart';
import 'OfflineGamePage.dart';

class GamePage extends StatelessWidget {
  final List<UserViewModel> users;
  final bool isWhite;
  final String gameId;
  bool canMove;
  final ChessBoardController chessBoardController = ChessBoardController();
  GamePage(this.users, this.gameId, this.isWhite) {
    canMove = isWhite;
    print(canMove);
  }

  @override
  Widget build(BuildContext context) {
    chessBoardController.game = chess.Chess();
    return StreamBuilder<Object>(
        stream: FirebaseFirestore.instance
            .collection('games')
            .doc(gameId)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['blackPlayer'] == '') {
              return Scaffold(
                appBar: GameAppBar3(
                  height: MediaQuery.of(context).size.height * 0.22,
                  imgheight: MediaQuery.of(context).size.height * 0.10,
                  imgwidth: MediaQuery.of(context).size.width,
                  user: UserViewModel(
                    name: 'Anonymous',
                    rate: 0,
                    avatar: -1,
                    gamePlayed: 0,
                    winRate: 0,
                    looseRate: 0,
                  ),
                  f: () {
                    FirebaseFirestore.instance
                        .collection('games')
                        .doc(gameId)
                        .delete();
                  },
                ),
                bottomNavigationBar: GameBottomBar(
                  [
                    IconNFunction(Icons.flag_outlined, () {}),
                    IconNFunction(Icons.campaign, () {}),
                    IconNFunction(Icons.wifi_protected_setup, () {}),
                    IconNFunction(Icons.arrow_back_rounded, () {}),
                    IconNFunction(Icons.arrow_forward_rounded, () {}),
                  ],
                ),
                body: Stack(children: [
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
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 11.5),
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: Container(
                          height: 70,
                          width: 70,
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.grey[500],
                            strokeWidth: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
              );
            } else {
              if (!canMove) {
                canMove = true;
              }
              chessBoardController.game.load_pgn(snapshot.data['gamePGN']);

              Provider.of<OfflineGameProvider>(context, listen: false)
                  .updatePGN(chessBoardController.game.pgn());
              return Scaffold(
                appBar: GameAppBar3(
                  height: MediaQuery.of(context).size.height * 0.22,
                  imgheight: MediaQuery.of(context).size.height * 0.10,
                  imgwidth: MediaQuery.of(context).size.width,
                  user: users.firstWhere((element) {
                    String enemy = (isWhite) ? 'blackPlayer' : 'whitePlayer';
                    return (element.name == snapshot.data[enemy]);
                  }),
                  f: () {
                    FirebaseFirestore.instance
                        .collection('games')
                        .doc(gameId)
                        .delete();
                  },
                ),
                bottomNavigationBar: GameBottomBar(
                  [
                    IconNFunction(Icons.flag_outlined, () {}),
                    IconNFunction(Icons.campaign, () {}),
                    IconNFunction(Icons.wifi_protected_setup, () {}),
                    IconNFunction(Icons.arrow_back_rounded, () {}),
                    IconNFunction(Icons.arrow_forward_rounded, () {}),
                  ],
                ),
                body: Stack(children: [
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
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 11.5),
                    child: Container(
                      height: MediaQuery.of(context).size.width,
                      width: MediaQuery.of(context).size.width,
                      child: ChessBoard(
                        chessBoardController: chessBoardController,
                        whiteSideTowardsUser: isWhite,
                        onMove: (move) {
                          Provider.of<OfflineGameProvider>(context,
                                  listen: false)
                              .updatePGN(chessBoardController.game.pgn());
                          (snapshot.data as DocumentSnapshot).reference.update(
                              {'gamePGN': chessBoardController.game.pgn()});
                          canMove = !canMove;
                        },
                        onCheck: (color) {},
                        onCheckMate: (color) {
                          showDialog(
                            context: context,
                            builder: (ctx) {
                              return AfterGamePopup(
                                  pieceColorString(color) + ' Win');
                            },
                          );
                        },
                        onDraw: () {},
                        size: MediaQuery.of(context).size.width,
                        enableUserMoves: (chessBoardController.game.turn ==
                            ((isWhite)
                                ? chess.Chess.WHITE
                                : chess.Chess.BLACK)),
                      ),
                    ),
                  ),
                ]),
              );
            }
          } else {
            return Container(
              color: Color(0x66222222),
            );
          }
        });
  }
}
