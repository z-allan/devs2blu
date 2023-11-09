import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw_riverpod/models/sw_api_model.dart';
import 'package:sw_riverpod/repositories/sw_api_repository.dart';

class ApiStarWarsProvider extends StateNotifier<AsyncValue<StarWarsApiModel>> {
  ApiStarWarsProvider() : super(const AsyncLoading()) {
    changePage(1);
  }
  void nextPage() async {
    int? page = this.state.value!.next;
    changePage(page);
  }

  void previousPage() async {
    int? page = this.state.value!.previous;
    if (page != null) {
      changePage(page);
    }
  }

  void search(int i, [String searchString = '']) async {
    if (i == 0) {
      this.state = AsyncValue.data(StarWarsApiModel(
          isSearch: true, next: null, previous: null, result: []));
    }
    if (i == 1) {
      await searchPage(searchString);
      this.state.value!.searchString = searchString;
    }
    if (i == 2) {
      changePage(1);
    }
  }

  Future<StarWarsApiModel> changePage(page) async {
    StarWarsApiModel result = StarWarsApiModel(
        isSearch: false, next: null, previous: null, result: []);
    try {
      this.state = const AsyncLoading();
      result = await StarWarsApiRepository.getPeople(page);
      this.state = AsyncValue.data(result);
    } on Exception catch (err, stack) {
      this.state = AsyncValue.error(err, stack);
    }
    return result;
  }

  Future<StarWarsApiModel> searchPage(searchStr) async {
    StarWarsApiModel result = StarWarsApiModel(
        isSearch: true, next: null, previous: null, result: []);
    try {
      this.state = const AsyncLoading();
      result = await StarWarsApiRepository.searchPeople(searchStr);
      this.state = AsyncValue.data(result);
    } on Exception catch (err, stack) {
      this.state = AsyncValue.error(err, stack);
    }
    return result;
  }
}

//final apiSwProvider = StateNotifierProvider((ref) => ApiStarWarsProvider());

final apiSwProvider =
    StateNotifierProvider<ApiStarWarsProvider, AsyncValue<StarWarsApiModel>>(
        (ref) => ApiStarWarsProvider());
