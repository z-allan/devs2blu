import 'package:dart_avancado/exercicios/ex05/model/currency_model.dart';
import 'package:intl/intl.dart';

class CurrencyList {
  List<CurrencyModel> currencies = [];
  late DateTime _dateNow = DateTime.now();

  int _getCurrencyIndex(CurrencyModel currencyItem) {
    currencies.forEach((element) {
      (element.description == currencyItem.description) ? true : false;
    });
    return -1;
  }

  void addItem(CurrencyModel currencyItem) {
    int index = this._getCurrencyIndex(currencyItem);
    if (index == -1) currencies.add(currencyItem);
  }

  void removeItem(CurrencyModel currencyItem) {
    int index = this._getCurrencyIndex(currencyItem);
    if (index != -1) currencies.removeAt(index);
  }

  void lastUpdateRefresh() {
    _dateNow = DateTime.now();
  }

  String get lastUpdate => DateFormat('dd/MM/yy HH:mm:ss').format(_dateNow);
}
