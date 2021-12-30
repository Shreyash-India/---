// ignore_for_file: avoid_print
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/architecture/article_layout.dart';
import 'package:news_app/utils/api_key.dart';

class News {
  List<Article> news = [];

  Future<void> getNews(String category) async {
    var url = "";
    if (category == "") {
      url =
          "https://newsapi.org/v2/top-headlines?country=in&category=business&apiKey=$apikey";
    } else {
      url =
          "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=$apikey";
    }

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((blog) {
        if (blog['urlToImage'] != null &&
            blog['description'] != null &&
            blog['title'] != null) {
          Article article = Article(
            title: blog['title'] as String?,
            author: blog['author'] as String?,
            description: blog['description'] as String?,
            urlToImage: blog['urlToImage'] as String?,
            publshedAt: DateTime.parse(blog['publishedAt']),
            content: blog["content"] as String?,
            url: blog["url"] as String?,
          );
          news.add(article);
        }
      });
    } else {
      print("Error");
    }
  }
}
