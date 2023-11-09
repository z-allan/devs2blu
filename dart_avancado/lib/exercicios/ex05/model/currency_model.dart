import 'package:intl/intl.dart';

class CurrencyModel {
  late String coin1;
  late String coin2;
  late String description;
  late String high;
  late String low;
  late String variaton;
  late String lastTrade;

  CurrencyModel(
      {required this.coin1,
      required this.coin2,
      required this.description,
      required this.high,
      required this.low,
      required this.variaton,
      required lastUpdate}) {
    this.lastTrade =
        DateFormat('dd/MM/yy HH:mm:ss').format(DateTime.parse(lastUpdate));
  }

  CurrencyModel.fromJson(Map<String, dynamic> currency) {
    this.coin1 = currency['code'];
    this.coin2 = currency['codein'];
    this.description = currency['name'];
    this.high = currency['high'];
    this.low = currency['low'];
    this.variaton = currency['pctChange'];
    this.lastTrade = DateFormat('dd/MM/yy HH:mm:ss')
        .format(DateTime.parse(currency['create_date']));
  }
}
