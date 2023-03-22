import 'package:flagfall/ViewModels/ChatViewModel.dart';
import 'package:flagfall/ViewModels/UserViewModel.dart';
import 'package:flagfall/Views/Components/Others/Background.dart';
import 'package:flagfall/Views/Components/Others/UserTile.dart';
import 'package:flutter/material.dart';

class OneChatPage extends StatelessWidget {
  final ChatViewModel chat;

  const OneChatPage(this.chat);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: UserTile(
          user: UserViewModel(
            name: chat.name,
            rate: chat.rate,
            avatar: chat.avatar,
          ),
          color: Colors.purple[700],
          fColor: Colors.white,
        ),
        backgroundColor: Colors.purple[700],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.purple[700],
        child: Container(
          height: MediaQuery.of(context).size.height / 13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // TextField(
              //   style: TextStyle(fontSize: 14),
              // ),
              IconButton(
                onPressed: () {},
                iconSize: 50,
                icon: Icon(Icons.send),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        children: [
          Background(
            image: 'assets\\images\\ChatBackGround.png',
          )
        ],
      ),
    );
  }
}
