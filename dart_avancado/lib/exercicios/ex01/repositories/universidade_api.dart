import 'dart:convert';

import 'package:dart_avancado/exercicios/ex01/const/const.dart';
import 'package:dart_avancado/exercicios/ex01/models/universidade_list.dart';
import 'package:http/http.dart' as http;

class UniversidadeRepository {
  static Future<List<UniversidadeModel>> getUniversidades() async {
    Uri uri =
        Uri.http('universities.hipolabs.com', 'search', {"country": "Brazil"});

    http.Response resposta = await http.get(uri);

    var respostaObj = jsonDecode(resposta.body);

    List<UniversidadeModel> lista = [];
    (respostaObj as List<dynamic>).forEach((element) {
      lista.add(UniversidadeModel.fromJson(element as MapJson));
    });

    print(lista.length);

    lista.sort(
      (a, b) => a.nome.compareTo(b.nome),
    );

    lista.unique((element) => element.nome);

    print(lista.length);

    return lista;
  }

  static int longestString(List<UniversidadeModel> lista) {
    UniversidadeModel item = lista.reduce((a, b) {
      return a.nome.length > b.nome.length ? a : b;
    });

    print(item.nome.length);

    return item.nome.length;
  }
}
