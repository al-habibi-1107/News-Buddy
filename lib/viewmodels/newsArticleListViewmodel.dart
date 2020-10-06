// this is basically to seperate the logic and the UI part of the app
// this class is the list view in the homepage
import 'package:flutter/material.dart';
import 'package:newsbuddy/models/news_article.dart';
import 'package:newsbuddy/services/http_service.dart';
import 'package:newsbuddy/viewmodels/newsArticleViewmodel.dart';

// Change notifier makes the UI rebuild if any
// changes occur by notifying listners
class NewsArticleListViewmodel with ChangeNotifier {
// an instance of the view model
  List<NewsArticleViewModel> articles = List<NewsArticleViewModel>();

  void populateList() async {
// 1. fetch the top headlines using the webservice(http) in
// the webservice class
    List<NewsArticle> newsArticle = await WebServices().fetchTopHeadlines();

// 2. use the fetched articles to make the list tile items by
// passing each article to view model and store it to local variable
    this.articles = newsArticle
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

// notifies all the UI components about the change;
    notifyListeners();
  }
}
