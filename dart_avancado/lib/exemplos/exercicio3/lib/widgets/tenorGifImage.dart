import "package:flutter/material.dart";
import "../models/tenorGifModel.dart";

class TenorGifImage extends StatelessWidget {
  final TenorGifModel tenorGif;

  const TenorGifImage({required this.tenorGif, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Image.network(
            tenorGif.imageURL,
            height: 300,
            width: 300,
            fit: BoxFit.fitHeight,
          ),
          Text(tenorGif.imageTitle)
        ],
      ),
    );
  }
}
