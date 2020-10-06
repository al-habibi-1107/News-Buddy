import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsbuddy/models/news_article.dart';

// to keep the api key in gitignore
import '../strings/keys.dart' as api;

// this class is responsible of making requests to the web
// for the json data
class WebServices {

  // function to fetch the data
  Future<List<NewsArticle>> fetchTopHeadlines() async {
    // enter your own Api Key
    final apiKey= api.apiKey;

    // url of the json
    final url = "http://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey";

    // await for the response
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // decode the response into the result
      final result = jsonDecode(response.body);

      // iterable (so that we can iterate upon it) to hold the list
      // of top headlines 
      Iterable list = result['articles'];

      // return a list of news articles
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Could not fetch Top headlines");
    }
  }
}
