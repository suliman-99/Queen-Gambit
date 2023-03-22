import 'package:flagfall/ViewModels/ArticleViewModel.dart';
import 'package:flutter/material.dart';

class ArticleListItem extends StatelessWidget {
  final ArticleViewModel articleViewModel;

  const ArticleListItem({Key key, this.articleViewModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25),
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            articleViewModel.title,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(
          articleViewModel.content,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        tileColor: Colors.white,
      ),
    );
  }
}
