import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './viewmodels/newsArticleListViewmodel.dart';
import './pages/news_list.dart';
import './pages/news_info.dart';

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
      // Adding routes for navigation
      routes: {
        NewsInfo.routeName :(ctx)=> NewsInfo(),
      },
    );
  }
}
