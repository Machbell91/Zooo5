/*import 'package:flutter/material.dart';

class Artikal extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News App',
      routes: {
        '/': (context) => NewsListPage(),
        '/article1': (context) => ArticlePage(article: articles[0]), 
        '/article2': (context) => ArticlePage(article: articles[1]),
        // etc... 
      },
      initialRoute: '/',
    );
  }

}

class NewsListPage extends StatelessWidget {

  final articles = [
    Article(
      'Article 1',
      'https://example.com/image1.jpg',
      'Contenu article 1'  
    ),
    Article(
      'Article 2',
      'https://example.com/image2.jpg',
      'Contenu article 2'
    ),
    // Reste des articles
  ];

  @override 
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text("Actualités")),
      body: _buildList(), 
    );

  }

  Widget _buildList() {
    return ListView.builder(
      itemCount: articles.length,
      itemBuilder: (context, index) {
        return _buildListItem(articles[index]);  
      },
    );
  }

  Widget _buildListItem(Article article) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, 
          '/article${index+1}'
        );
      },
      child: ListItem(article: article), 
    );
  }

}*/