import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw_riverpod/providers/sw_api_provider.dart';

class SearchBarWidget extends ConsumerWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    TextEditingController searchController = TextEditingController();
    bool search = false;
    bool showButton = true;
    Widget? messageToShow;
    Widget loadingProgress = Container();
    bool autoFocus = true;

    final apiProvider = ref.watch(apiSwProvider);
    apiProvider.when(
      data: (data) {
        search = data.isSearch;
        searchController.text = data.searchString;
        messageToShow = const Text('Star Wars People');
        loadingProgress = Container();
      },
      error: (error, stackTrace) {},
      loading: () {
        // messageToShow = const LinearProgressIndicator(
        //   borderRadius: BorderRadius.all(Radius.circular(20)),
        // );
        messageToShow = const Text('Searching...');
        showButton = false;
        loadingProgress = const LinearProgressIndicator();
      },
    );

    if (searchController.text.isNotEmpty) {
      autoFocus = false;
    }

    return AppBar(
      title: search
          ? TextField(
              autofocus: autoFocus,
              controller: searchController,
              style: const TextStyle(
                  decoration: TextDecoration.none),
              decoration: const InputDecoration(
                  hintText: 'Pesquise aqui...', border: InputBorder.none),
            )
          : messageToShow,
      bottom: PreferredSize(
          preferredSize: const Size.fromWidth(double.infinity),
          child: loadingProgress),
      actions: [
        showButton
            ? !search
                ? searchController.text.isEmpty
                    ? ButtonSearch(
                        search: search, controller: searchController, ref: ref)
                    : ButtonCancel(controller: searchController, ref: ref)
                : searchController.text.isEmpty
                    ? ButtonSearch(
                        search: search, controller: searchController, ref: ref)
                    : ButtonCancel(controller: searchController, ref: ref)
            : Container()
      ],
    );
  }
}

class ButtonSearch extends StatelessWidget {
  final TextEditingController controller;
  final WidgetRef ref;
  final bool search;

  const ButtonSearch(
      {required this.search,
      required this.controller,
      required this.ref,
      super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (search) {
            if (controller.text.isEmpty) {
              ref.read(apiSwProvider.notifier).search(2);
            } else {
              ref.read(apiSwProvider.notifier).search(1, controller.text);
            }
          } else {
            ref.read(apiSwProvider.notifier).search(0);
          }
        },
        icon: const Icon(Icons.search));
  }
}

class ButtonCancel extends StatelessWidget {
  final TextEditingController controller;
  final WidgetRef ref;

  const ButtonCancel({required this.controller, required this.ref, super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          ref.read(apiSwProvider.notifier).search(2);
        },
        icon: const Icon(Icons.cancel));
  }
}
