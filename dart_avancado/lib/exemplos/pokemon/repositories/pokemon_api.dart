import 'dart:convert';

import 'package:dart_avancado/exemplos/pokemon/const/const.dart';
import 'package:dart_avancado/exemplos/pokemon/model/pokemon_list.dart';
import 'package:http/http.dart' as http;

class PokemonRepository {
  static Future<List<PokemonListModel>> getPokemons() async {
    Uri uri = Uri.https('pokeapi.co', 'api/v2/pokemon', {"limit": "150"});
    http.Response resposta = await http.get(uri);
    var respostaObj = jsonDecode(resposta.body);

    List<PokemonListModel> listaPokemon = [];
    (respostaObj['results'] as List<dynamic>).forEach((element) {
      listaPokemon.add(PokemonListModel.fromJson(element as MapJson));
    });

    return listaPokemon;
  }
}
