import 'package:dart_avancado/exercicios/ex02e03/models/giphy_gif.dart';
import 'package:flutter/material.dart';

class GiphyGifImage extends StatelessWidget {
  final GiphyGifModel giphyGif;

  GiphyGifImage({required this.giphyGif, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.parse(giphyGif.icon_width),
      height: double.parse(giphyGif.icon_height),
      child: Image(
          image: NetworkImage(giphyGif.icon_url),
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
                child: SizedBox(
                    height: 30, width: 30, child: CircularProgressIndicator()));
          }),
    );
  }
}
