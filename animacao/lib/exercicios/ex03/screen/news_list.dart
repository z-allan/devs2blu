import 'dart:convert';
import 'package:animacao/exercicios/ex03/data/json.dart';
import 'package:animacao/exercicios/ex03/model/news_model.dart';
import 'package:animacao/exercicios/ex03/screen/news_detail.dart';
import 'package:animacao/exercicios/ex03/widget/news_tile.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<NewsModel> _newsList = [];

  NewsList({super.key});

  void searchProducts() {
    var jsonProducts = json.decode(NewsJson.content);
    for (var item in jsonProducts['articles']) {
      _newsList.add(NewsModel.json(item));
    }
  }

  @override
  Widget build(BuildContext context) {
    searchProducts();
    return Scaffold(
      appBar: AppBar(title: const Text('Exercicio 3')),
      body: ListView.builder(
        itemBuilder: (context, index) => NewsTile(
            news: _newsList[index],
            onClick: (news) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NewsDetail(news: _newsList[index])));
            }),
        itemCount: _newsList.length,
      ),
    );
  }
}
