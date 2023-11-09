// ignore_for_file: must_be_immutable

import "dart:async";

import "package:dart_avancado/exercicios/ex05/model/currency_list.dart";
import "package:dart_avancado/exercicios/ex05/repositories/awesome_api.dart";
import "package:flutter/material.dart";

class CurrencyListWidget extends InheritedWidget {
  CurrencyList _currencyList = CurrencyList();
  final StreamController<CurrencyList> _streamController =
      new StreamController<CurrencyList>.broadcast();

  List<String> pairList = [
    'USD-BRL',
    'EUR-BRL',
    'BTC-BRL',
    'ETH-BRL',
    'LTC-BRL',
    'XRP-BRL',
    'USD-ZAR',
    'USD-AUD',
  ];

  CurrencyListWidget({required super.child}) {
    _initTimer();
  }

  Future<CurrencyList> _initTimer() async {
    _currencyList = await AwesomeApiRepository.getCurrencies(pairList);
    _streamController.sink.add(_currencyList);
    Timer.periodic(Duration(seconds: 60), (timer) async {
      _currencyList = await AwesomeApiRepository.getCurrencies(pairList);
      _streamController.sink.add(_currencyList);
    });
    return _currencyList;
  }

  CurrencyList get currencyList => this._currencyList;

  Stream<CurrencyList> get stream => this._streamController.stream;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return true;
  }

  static CurrencyListWidget? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CurrencyListWidget>();
  }
}
