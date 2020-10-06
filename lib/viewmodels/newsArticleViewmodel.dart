
// Viewmodels are input for widgets 
import 'package:newsbuddy/models/news_article.dart';


// this class is for each of the list tiles of the 
// list view of the list view 
class NewsArticleViewModel{

// Create an instance of News Article
// as a private property of the class
NewsArticle _newsArticle;

// Constructor for the viewmodel, gets the News Article
// and initialises it to the private property _newsArticle
NewsArticleViewModel({NewsArticle article}):_newsArticle = article;


// getters to return all the properties
// of the news Article
String get title{
  return _newsArticle.title;
}

String get description{
  return _newsArticle.description;
}

String get author{
  return _newsArticle.author;
}

String get url{
  return _newsArticle.url;
}

String get urlToImage{
  return _newsArticle.urlToImage;
}


}