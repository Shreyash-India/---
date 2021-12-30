// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, use_key_in_widget_constructors, sized_box_for_whitespace
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/architecture/article_layout.dart';
import 'package:news_app/architecture/category_layout.dart';
import 'package:news_app/utils/category_info.dart';
import 'package:news_app/utils/news.dart';
import 'package:news_app/views/article_web_view.dart';
import 'package:news_app/views/category_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Category> categoriesList = <Category>[];
  List<Article> articlesList = <Article>[];
  bool _isLoading = true;

  void fetchNews() async {
    News news = News();
    await news.getNews("");
    articlesList = news.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    // Load the Title Bar section
    categoriesList = TitleBar();
    // Load the Body section
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
        backgroundColor: Colors.white,
        elevation: 0.4,
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: <Widget>[
                    // Categories
                    Container(
                      height: 80,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoriesList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return CategoryCard(
                              categoryUrl: categoriesList[index].categoryUrl,
                              categoryName: categoriesList[index].categoryName,
                            );
                          }),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // Articles
                    Container(
                      child: ListView.builder(
                          itemCount: articlesList.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ArticleCard(
                              imageUrl: articlesList[index].urlToImage,
                              desc: articlesList[index].description,
                              title: articlesList[index].title,
                              publshedAt:
                                  (articlesList[index].publshedAt).toString(),
                              url: articlesList[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String? imageUrl, desc, title, publshedAt, url;
  const ArticleCard(
      {required this.imageUrl,
      required this.desc,
      required this.title,
      required this.publshedAt,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ArticleWebView(
                      Url: url,
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.network(imageUrl!),
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 253, 119, 119),
                    blurRadius: 5.0,
                    offset: Offset(3, 7),
                    spreadRadius: 0.1,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              title!,
              style: const TextStyle(
                fontSize: 17,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(desc!,
                style: const TextStyle(fontSize: 12, color: Colors.black54)),
            const SizedBox(
              height: 6,
            ),
            Text(publshedAt!,
                style: const TextStyle(
                    fontSize: 12, color: Color.fromARGB(133, 248, 6, 6))),
          ],
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  final String categoryUrl, categoryName;

  const CategoryCard(
      {Key? key, required this.categoryUrl, required this.categoryName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryView(
                      category: categoryName.toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Color.fromARGB(255, 250, 112, 112),
                    blurRadius: 2.0,
                    offset: Offset(0, 10),
                    spreadRadius: 0.4,
                  ),
                ],
                borderRadius: BorderRadius.circular(8),
              ),
              child: CachedNetworkImage(
                imageUrl: categoryUrl,
                height: 75,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}
