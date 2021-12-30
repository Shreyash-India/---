// ignore_for_file: non_constant_identifier_names, avoid_unnecessary_containers, must_be_immutable, sized_box_for_whitespace
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebView extends StatefulWidget {
  String? Url;
  ArticleWebView({Key? key, required this.Url}) : super(key: key);

  @override
  _ArticleWebViewState createState() => _ArticleWebViewState();
}

class _ArticleWebViewState extends State<ArticleWebView> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: WebView(
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
          initialUrl: widget.Url,
        ),
      ),
    );
  }
}
