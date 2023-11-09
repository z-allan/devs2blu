import 'dart:convert';

import 'package:dart_avancado/exercicios/ex05/model/currency_list.dart';
import 'package:dart_avancado/exercicios/ex05/model/currency_model.dart';
import 'package:http/http.dart' as http;

class AwesomeApiRepository {
  static Future<CurrencyList> getCurrencies(List pairList) async {
    String list = '';
    pairList.forEach((element) {
      list += '$element,';
    });
    list = list.substring(0, list.length - 1);

    Uri uri = Uri.https('economia.awesomeapi.com.br', 'last/$list');
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);

    CurrencyList tempList = CurrencyList();
    (respostaObj as Map<String, dynamic>).forEach(
      (key, value) {
        tempList.addItem(CurrencyModel.fromJson(value));
      },
    );
    tempList.lastUpdateRefresh();

    return tempList;
  }
}
