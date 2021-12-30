// ignore_for_file: avoid_unnecessary_containers, unused_field, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:news_app/architecture/article_layout.dart';
import 'package:news_app/utils/news.dart';
import 'package:news_app/views/home.dart';

class CategoryView extends StatefulWidget {
  final String category;
  const CategoryView({required this.category});
  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  bool _isLoading = true;
  List<Article> articles = <Article>[];

  Future<void> fetchNews() async {
    News news = News();
    await news.getNews(widget.category);
    articles = news.news;

    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // fetch News for Clicked Category
    fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Text(
              "ताजा",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(255, 241, 202, 202),
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 4),
            Text(
              "खबर",
              style: TextStyle(
                  fontSize: 30,
                  color: Color.fromARGB(221, 230, 19, 19),
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
            ),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(children: [
                Container(
                  child: ListView.builder(
                      itemCount: articles.length,
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return ArticleCard(
                          imageUrl: articles[index].urlToImage,
                          desc: articles[index].description,
                          title: articles[index].title,
                          publshedAt: (articles[index].publshedAt).toString(),
                          url: articles[index].url,
                        );
                      }),
                )
              ]),
            ),
    );
  }
}
