import 'package:dart_avancado/exemplos/threads/screens/compute.dart';
import 'package:dart_avancado/exemplos/threads/screens/isolate.dart';
import 'package:dart_avancado/exemplos/threads/screens/stream.dart';
import 'package:flutter/material.dart';

typedef MenuItem = Map<String, dynamic>;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<MenuItem> _menuItems = const [
    {'icon': null, 'label': 'Compute'},
    {'icon': null, 'label': 'Isolate'},
    {'icon': null, 'label': 'Stream'},
  ];
  final List<Widget> _bodyItems = const [
    ComputeScreen(),
    IsolateScreen(),
    StreamScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_menuItems[_index]['label']),
        ),
        body: IndexedStack(
          index: _index,
          children: _bodyItems,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (value) => setState(() => _index = value),
          items: _menuItems
              .map((e) => BottomNavigationBarItem(
                  icon: Icon(e['icon']), label: e['label']))
              .toList(),
          iconSize: 0,
          selectedLabelStyle: TextStyle(color: Colors.blue, fontSize: 24),
          unselectedLabelStyle: TextStyle(color: Colors.grey, fontSize: 16),
        ));
  }
}
