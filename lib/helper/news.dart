import 'dart:convert';

import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  
  List<ArticleModel> news = [];
  Future<void> getNews() async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&apiKey=97322a16fa4e474797dfd4f8eece3371";

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status'] == "ok") {
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] !=null) {
        // ignore: unused_local_variable
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
        );
      }
    });
  }
  }
}

class CategoryNewsClass {
  
  List<ArticleModel> news = [];
  Future<void> getNews(String category) async {
    String url = "http://newsapi.org/v2/top-headlines?country=in&category=$category&country=in&apiKey=97322a16fa4e474797dfd4f8eece3371";

  var response = await http.get(url);
  var jsonData = jsonDecode(response.body);
  if(jsonData['status'] == "ok") {
    jsonData["articles"].forEach((element){

      if(element["urlToImage"] != null && element['description'] !=null) {
        // ignore: unused_local_variable
        ArticleModel articleModel = ArticleModel(
          title: element['title'],
          author: element["author"],
          description: element["description"],
          url: element["url"],
          urlToImage: element["urlToImage"],
          content: element["content"],
        );
      }
    });
  }
  }
}

