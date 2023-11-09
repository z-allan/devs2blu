import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sw_riverpod/models/sw_api_model.dart';
import 'package:sw_riverpod/models/sw_people_model.dart';

class StarWarsApiRepository {
  static Future<StarWarsApiModel> getPeople([int? page]) async {
    Uri? uri;

    if (page != null) {
      uri = Uri.https("swapi.dev", "/api/people", {"page": page.toString()});
    } else {
      uri = Uri.https("swapi.dev", "/api/people", {"page": "1"});
    }

    http.Response resposta = await http.get(uri);
    if (resposta.statusCode != 200) {
      throw Exception(
          "Erro ao buscar os dados da pessoa: Erro HTTP ${resposta.statusCode}");
    }

    var result = jsonDecode(resposta.body);
    List<StarWarsPeopleModel> list = [];

    for (var element in result["results"]) {
      list.add(StarWarsPeopleModel.fromJson(element));
    }

    int? next = result['next'] != null
        ? int.tryParse(result['next'].toString().split('=')[1])
        : null;
    int? prev = result['previous'] != null
        ? int.tryParse(result['previous'].toString().split('=')[1])
        : null;

    return StarWarsApiModel(
        isSearch: false, next: next, previous: prev, result: list);
  }

  static Future<StarWarsApiModel> searchPeople(strSearch) async {
    Uri uri = Uri.https("swapi.dev", "/api/people", {"search": strSearch});

    http.Response resposta = await http.get(uri);
    if (resposta.statusCode != 200) {
      throw Exception(
          "Erro ao buscar os dados da pessoa: Erro HTTP ${resposta.statusCode}");
    }

    var result = jsonDecode(resposta.body);
    List<StarWarsPeopleModel> list = [];

    for (var element in result["results"]) {
      list.add(StarWarsPeopleModel.fromJson(element));
    }

    int? next = result['next'] != null
        ? int.tryParse(result['next'].toString().split('=')[1])
        : null;
    int? prev = result['previous'] != null
        ? int.tryParse(result['previous'].toString().split('=')[1])
        : null;

    return StarWarsApiModel(
        isSearch: true, next: next, previous: prev, result: list);
  }
}
