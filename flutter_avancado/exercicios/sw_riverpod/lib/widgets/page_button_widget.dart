import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sw_riverpod/providers/sw_api_provider.dart';

class PageButtonWidget extends ConsumerWidget {
  const PageButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool havePrevious = false;
    bool haveNext = false;
    Widget? middleInformation;

    ref.watch(apiSwProvider).when(
      data: (data) {
        middleInformation =
            Text("Página ${data.current}", textAlign: TextAlign.center);
        havePrevious = data.previous != null ? true : false;
        haveNext = data.next != null ? true : false;
      },
      error: (error, stackTrace) {
        middleInformation = IconButton(
          icon: const Icon(
            Icons.refresh,
            color: Colors.blue,
            size: 30,
          ),
          onPressed: () => ref.read(apiSwProvider.notifier).changePage(1),
        );
      },
      loading: () {
        middleInformation =
            const Text('Loading Page...', textAlign: TextAlign.center);
      },
    );

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        FloatingActionButton(
          heroTag: "btnPrev",
          onPressed: !havePrevious
              ? null
              : () => ref.read(apiSwProvider.notifier).previousPage(),
          backgroundColor: Colors.transparent,
          foregroundColor: havePrevious ? Colors.blue : Colors.transparent,
          elevation: 0,
          child: const Icon(
            Icons.navigate_before_rounded,
            size: 50,
          ),
        ),
        SizedBox(width: 100, child: middleInformation),
        FloatingActionButton(
            heroTag: "btnNext",
            onPressed: !haveNext
                ? null
                : () => ref.read(apiSwProvider.notifier).nextPage(),
            backgroundColor: Colors.transparent,
            foregroundColor: haveNext ? Colors.blue : Colors.transparent,
            elevation: 0,
            child: const Icon(Icons.navigate_next_rounded, size: 50))
      ]),
    );
  }
}
