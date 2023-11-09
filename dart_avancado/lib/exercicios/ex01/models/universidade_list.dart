import 'package:dart_avancado/exemplos/pokemon/const/const.dart';

class UniversidadeModel {
  String nome = '';
  String site = '';

  UniversidadeModel({required this.nome, required this.site});

  UniversidadeModel.fromJson(MapJson json) {
    this.nome = json['name'];
    this.site = json['web_pages'][0];
  }

  MapJson toJson() {
    return {
      "name": this.nome,
      "web_pages": [this.site]
    };
  }
}
