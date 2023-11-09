import "dart:convert";

import "../models/tenorGifModel.dart";
import "package:http/http.dart" as http;

class TenorGifRepository {
  static const String AUTH_KEY = "AIzaSyBwbpFWe4wrldxgEXgwcWYj_5VRQIwTntM";
  static const String CLIENT_KEY = "my_test_app";

  // Exercício 2
  static Future<List<TenorGifModel>> getTrendingGifs() async {
    Uri uri = Uri.https("tenor.googleapis.com", "/v2/featured", {
      "key": TenorGifRepository.AUTH_KEY,
      "client_key": TenorGifRepository.CLIENT_KEY
    });

    http.Response resposta = await http.get(uri);

    var respostaMap = jsonDecode(resposta.body);

    List<TenorGifModel> gifList = [];

    (respostaMap["results"] as List<dynamic>).forEach((element) {
      gifList.add(TenorGifModel.fromJson(element));
    });

    return gifList;
  }

  // Exercício 3
  static Future<List<TenorGifModel>> search(String search,
      [int limit = 20]) async {
    Uri uri = Uri.https("tenor.googleapis.com", "/v2/search", {
      "key": TenorGifRepository.AUTH_KEY,
      "client_key": TenorGifRepository.CLIENT_KEY,
      "limit": limit.toString(),
      "q": search
    });

    http.Response resposta = await http.get(uri);

    var respostaMap = jsonDecode(resposta.body);

    List<TenorGifModel> gifList = [];

    (respostaMap["results"] as List<dynamic>).forEach((element) {
      gifList.add(TenorGifModel.fromJson(element));
    });

    return gifList;
  }
}
