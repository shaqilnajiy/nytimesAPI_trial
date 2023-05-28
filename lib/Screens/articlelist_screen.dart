import 'package:flutter/material.dart';

class ArticleListScreen extends StatelessWidget {
  final String searchQuery;
  final dynamic articles;

  const ArticleListScreen({required this.searchQuery, required this.articles});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Articles'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.black),
            bottom: BorderSide(color: Colors.black),
          ),
        ),
        child: ListView.builder(
          itemCount: articles['response']['docs'].length,
          itemBuilder: (context, index) {
            final article = articles['response']['docs'][index];
            final title = article['headline']['main'];
            final datePublished = article['pub_date'];

            return ListTile(
              title: Text(title),
              subtitle: Text(datePublished),
            );
          },
        ),
      ),
    );
  }
}
