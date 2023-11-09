import 'dart:convert';
import 'package:dart_avancado/exercicios/ex02e03/models/giphy_gif.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
//import 'package:url_launcher/url_launcher.dart';

class GiphyRepository {
  static final API_KEY = dotenv.env['API_GIPHY'];

  static Future<List<GiphyGifModel>> getTrendingGifs() async {
    Uri uri =
        Uri.https('api.giphy.com', 'v1/gifs/trending', {"api_key": API_KEY});

    http.Response resposta = await http.get(uri);

    var respostaObj = jsonDecode(resposta.body);

    List<GiphyGifModel> lista = [];
    (respostaObj['data'] as List<dynamic>).forEach((element) {
      lista.add(GiphyGifModel.fromJson(element as Map<String, dynamic>));
    });

    return lista;
  }

  static Future<List<GiphyGifModel>> getSearchGifs(String prPesquisa) async {
    Uri uri = Uri.https('api.giphy.com', 'v1/gifs/search',
        {"api_key": API_KEY, 'q': prPesquisa});

    http.Response resposta = await http.get(uri);

    var respostaObj = jsonDecode(resposta.body);

    List<GiphyGifModel> lista = [];
    (respostaObj['data'] as List<dynamic>).forEach((element) {
      lista.add(GiphyGifModel.fromJson(element as Map<String, dynamic>));
    });

    return lista;
  }

  // static abrirNoBrowser(String prUrl) async {
  //   final Uri url = Uri.parse(prUrl);
  //   if (!await launchUrl(url)) {
  //     throw Exception('Could not launch $url');
  //   }
  // }
}
