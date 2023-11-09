import 'package:flutter/material.dart';
import 'package:sw_riverpod/widgets/page_button_widget.dart';
import 'package:sw_riverpod/widgets/person_list_widget.dart';
import 'package:sw_riverpod/widgets/search_bar_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(50), child: SearchBarWidget()),
      body: PersonListWidget(),
      bottomNavigationBar: PageButtonWidget(),
    );
  }
}
