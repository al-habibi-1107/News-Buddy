import 'package:flutter/material.dart';

import '../viewmodels/newsArticleViewmodel.dart';

class NewsInfo extends StatefulWidget {
  //routename
  static const routeName = "/news-info";
  @override
  _NewsInfoState createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  @override
  Widget build(BuildContext context) {
    NewsArticleViewModel article = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        title: Text("News Buddy"),
      ),
      body: Column(
        children: [
          Text(article.title),
        ],
      ),
    );
  }
}
