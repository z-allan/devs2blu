import 'package:animacao/exercicios/ex03/model/news_model.dart';
import 'package:flutter/material.dart';

typedef SelectedNews = void Function(NewsModel news);

class NewsTile extends StatelessWidget {
  final NewsModel _news;
  final SelectedNews _onNewsSelect;

  const NewsTile(
      {required NewsModel news, required SelectedNews onClick, super.key})
      : _onNewsSelect = onClick,
        _news = news;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(8),
      leading: Hero(
        tag: 'hero-image-${_news.hashCode}',
        child: Image(
            image: NetworkImage(_news.urlToImage),
            width: 100,
            errorBuilder: (context, error, stackTrace) {
              return const SizedBox(
                width: 100,
                child: Icon(
                  Icons.no_photography_outlined,
                  size: 30,
                  color: Colors.grey,
                ),
              );
            }),
      ),
      title: Text(
        _news.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        _news.description,
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
        style: const TextStyle(color: Colors.black),
      ),
      onTap: () => _onNewsSelect(this._news),
    );
  }
}
