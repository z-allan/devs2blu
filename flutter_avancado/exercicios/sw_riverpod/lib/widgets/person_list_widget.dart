import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw_riverpod/providers/sw_api_provider.dart';
import 'package:sw_riverpod/widgets/person_tile_widget.dart';

class PersonListWidget extends ConsumerWidget {
  final String? searchQuery;
  const PersonListWidget({this.searchQuery, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (this.searchQuery != null) {
      ref.read(apiSwProvider.notifier).searchPage(searchQuery);
    }

    final apiProvider = ref.watch(apiSwProvider);

    return apiProvider.when(
      data: (data) {
        return ListView.builder(
          itemCount: data.result.length,
          itemBuilder: (context, index) {
            return PersonTileWidget(peopleModel: data.result[index]);
          },
        );
      },
      error: (error, stackTrace) {
        return Padding(
          padding: const EdgeInsets.all(48.0),
          child: Center(
            child: Text(
              "$error",
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red, fontSize: 15),
            ),
          ),
        );
      },
      loading: () {
        return const Center(
          child: SizedBox(
            width: 50,
            height: 50,
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
    //Text("Next: ${snapshot.data!.next} | Previous: ${snapshot.data!.previous}");
  }
}
