// ignore_for_file: must_be_immutable

import 'dart:async';

import 'package:flutter/material.dart';

typedef SearchWidgetOnSearch = void Function(String search);

class SearchWidget extends StatelessWidget {
  String pesquisa = '';
  Timer? timer;
  SearchWidgetOnSearch onSearch;

  SearchWidget({required this.onSearch, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Faça uma pesquisa...',
      ),
      onChanged: (value) {
        if (timer != null) {
          timer!.cancel();
        }
        pesquisa = value;
        timer = Timer(Duration(milliseconds: 1000), () {
          onSearch(pesquisa);
        });
      },
    );
  }
}
