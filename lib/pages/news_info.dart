import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

import '../viewmodels/newsArticleViewmodel.dart';

class NewsInfo extends StatefulWidget {
  //routename
  static const routeName = "/news-info";
  @override
  _NewsInfoState createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {

  _launchUrl(article) async {
    if (await canLaunch(article.url)) {
      await launch(article.url);
    } else {
      throw "Could not launch url";
    }
  }

  @override
  Widget build(BuildContext context) {
    final device = MediaQuery.of(context).size;

    NewsArticleViewModel article = ModalRoute.of(context).settings.arguments;


    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
        title: const Text("News Buddy"),
      ),
      // Stack to make the UI stack on top of each other
      body: Stack(
        children: [
          // Stack Level 1
          Image.network(
            article.urlToImage,
            height: device.height * 0.5,
            fit: BoxFit.fill,
          ),
          // Stack level 2
          Card(
            margin:
                EdgeInsets.only(left: 0, right: 0, top: device.height * 0.45),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            elevation: 5,
            child: Padding(
              padding: EdgeInsets.only(
                  left: device.width * 0.09,
                  top: 30,
                  right: device.width * 0.09),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    article.title,
                    style: GoogleFonts.ubuntu(
                        fontWeight: FontWeight.w600, fontSize: 18),
                  ),
                  SizedBox(height: 25),
                  Text(
                    article.description,
                    style: GoogleFonts.montserrat(fontSize: 15, height: 1.5),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "- By ${article.author}",
                    style: GoogleFonts.ubuntu(
                        fontSize: 15, fontWeight: FontWeight.w800),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: FloatingActionButton(
              onPressed: (){
                _launchUrl(article);
              },
              backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
              child: Icon(Icons.web),
            ),
          ),
        ],
      ),
    );
  }

  
}
