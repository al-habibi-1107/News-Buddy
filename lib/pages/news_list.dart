import 'package:flutter/material.dart';
import 'package:newsbuddy/viewmodels/newsArticleViewmodel.dart';
import 'package:provider/provider.dart';

import '../viewmodels/newsArticleListViewmodel.dart';
import './news_info.dart';

class NewsList extends StatefulWidget {
  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  // when the page is created , init state is called
  // and the news is populated
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewmodel>(context, listen: false)
        .populateList();
  }

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<NewsArticleListViewmodel>(context);
    final device = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(23, 23, 23, 1),
        title: Text("News Buddy"),
      ),
      // A list view for the body
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
                GestureDetector(
                  onTap: () {
                    
                    Navigator.of(context).pushNamed(NewsInfo.routeName,arguments: article);
                  },
                  child: ClipRRect(
                    // when image is not available
                    // a placeholder is made
                    child: article.urlToImage == null
                        ? Image.asset("images/news-placeholder.png")
                        : Image.network(article.urlToImage),
                    borderRadius: BorderRadius.circular(5),
                  ),
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
