import 'package:flutter/material.dart';
import 'package:newsbuddy/viewmodels/newsArticleListViewmodel.dart';
import 'package:provider/provider.dart';

class NewsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewmodel>(context);
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        title: Text("News Buddy"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final article = vm.articles[index];

          return Container(
            width: device.width * 0.9,
            padding: EdgeInsets.symmetric(
                horizontal: device.width * 0.05, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  child: article.urlToImage == null
                      ? Image.asset("images/news-placeholder.png")
                      : Image.network(article.urlToImage),
                  borderRadius: BorderRadius.circular(5),
                ),
                SizedBox(height: 5),
                Text(
                  article.title,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        },
        itemCount: vm.articles.length,
      ),
    );
  }
}
