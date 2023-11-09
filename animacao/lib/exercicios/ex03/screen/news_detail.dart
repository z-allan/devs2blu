import 'package:animacao/exercicios/ex03/model/news_model.dart';
import 'package:flutter/material.dart';

class NewsDetail extends StatelessWidget {
  final NewsModel _news;

  const NewsDetail({required NewsModel news, super.key}) : _news = news;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        ListView(children: [
          Hero(
            tag: 'hero-image-${_news.hashCode}',
            child: Image(
                image: NetworkImage(_news.urlToImage),
                height: 400,
                width: double.infinity,
                fit: BoxFit.cover,
                alignment: Alignment.topCenter,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    height: 400,
                    color: Colors.grey,
                    child: const Icon(
                      Icons.no_photography_outlined,
                      size: 120,
                      color: Colors.white,
                    ),
                  );
                }),
          ),
          ListTile(
            contentPadding: const EdgeInsets.all(30),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                _news.title,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
              ),
            ),
            isThreeLine: true,
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Text(
                    _news.description,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  _news.content,
                  style: const TextStyle(color: Colors.black, fontSize: 16),
                ),
              ],
            ),
          )
        ]),
        Positioned(
            top: 15,
            left: 5,
            child: IconButton(
              icon: const Icon(Icons.arrow_back_rounded),
              color: Colors.white,
              iconSize: 40,
              onPressed: () => Navigator.of(context).pop(),
            ))
      ]),
    );
  }
}
