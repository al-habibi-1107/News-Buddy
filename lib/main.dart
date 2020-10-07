import 'package:flutter/material.dart';
import 'package:newsbuddy/viewmodels/newsArticleListViewmodel.dart';
import 'package:provider/provider.dart';
import 'package:newsbuddy/pages/news_list.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "News Buddy",
      // Sets up a provider so that changes in NewsArticleViewmodel are 
      // heard in the news list page
      home: ChangeNotifierProvider(
        create: (context) => NewsArticleListViewmodel(),
        child: NewsList(),
      ),
    );
  }
}
