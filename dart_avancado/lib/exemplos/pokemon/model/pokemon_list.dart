import 'package:dart_avancado/exemplos/pokemon/const/const.dart';

class PokemonListModel {
  String name = '';
  String url = '';

  PokemonListModel({required this.name, required this.url});

  PokemonListModel.fromJson(MapJson json) {
    this.name = json['name'];
    this.url = json['url'];
  }

  MapJson toJson() {
    return {'name': this.name, 'url': this.url};
  }
}
