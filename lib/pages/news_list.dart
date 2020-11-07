import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

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
      // A list view for the body
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              width: device.width * 0.87,
              child: Row(
                children: [
                  Text(
                    "Discover New",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: device.width * 0.9,
              height: 50,
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final stories = vm.articles[index];
                  return Container(
                    padding: EdgeInsets.all(5),
                    child: ClipRRect(
                      child: Image.network(
                        stories.urlToImage,
                        fit: BoxFit.fitHeight,
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  );
                },
                itemCount: 20,
                scrollDirection: Axis.horizontal,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  final article = vm.articles[index + 5];

                  return Container(
                  
                    width: device.width * 0.9,
                    padding: EdgeInsets.symmetric(
                        horizontal: device.width * 0.05, vertical: 15),
                    child: Container(
                       decoration: BoxDecoration(
                      border: Border.all(color:Colors.black)
                    ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(NewsInfo.routeName,
                                  arguments: article);
                            },
                            child: ClipRRect(
                              // when image is not available
                              // a placeholder is made
                              child: article.urlToImage == null
                                  ? Image.asset("images/news-placeholder.png")
                                  : Image.network(article.urlToImage),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                            ),
                          ),
                          Container(
                            width: device.width * 0.9,
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(5),
                                  bottomRight: Radius.circular(5)),
                              color: Color.fromRGBO(23, 23, 23, 1),
                            ),
                            child: Text(
                              article.title,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                color: Color.fromRGBO(246, 246, 246, 1),
                                fontSize: 13,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
                itemCount: vm.articles.length - 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
