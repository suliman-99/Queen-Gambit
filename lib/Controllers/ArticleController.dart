import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flagfall/Models/ArticleModel.dart';
import 'package:flagfall/ViewModels/ArticleViewModel.dart';

class ArticleController {
  Future<List<ArticleViewModel>> getArticles() async {
    await Firebase.initializeApp();
    var response = await FirebaseFirestore.instance
        .collection('articles')
        .doc('articles')
        .get();

    List<ArticleModel> tempArticles = response
        .data()['articles']
        .map<ArticleModel>((e) => ArticleModel.fromMap(e))
        .toList();

    List<ArticleViewModel> articles = tempArticles
        .map<ArticleViewModel>(
            (e) => ArticleViewModel(title: e.title, content: e.content))
        .toList();

    return articles;
  }
}
