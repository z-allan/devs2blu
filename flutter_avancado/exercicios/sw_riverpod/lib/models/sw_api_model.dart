import 'package:sw_riverpod/models/sw_people_model.dart';

class StarWarsApiModel {
  late int? next;
  late int? previous;
  late List<StarWarsPeopleModel> result;
  int current = 1;

  late bool isSearch;
  late String searchString = '';

  StarWarsApiModel(
      {required this.isSearch,
      required this.next,
      required this.previous,
      required this.result}) {
    this.current = this.previous != null ? this.previous! + 1 : 1;
  }
}
