import 'package:dart_avancado/exemplos/onchange/widgets/search_field.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> listaPesquisa = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('onChange update'),
      ),
      body: ListView.builder(
        reverse: true,
        itemCount: listaPesquisa.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.search),
            title: Text(listaPesquisa[index]),
          );
        },
      ),
      floatingActionButton: IconButton(
          color: Colors.blue,
          icon: Icon(Icons.delete_forever),
          onPressed: () => setState(() => listaPesquisa.clear())),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
            border: Border(top: BorderSide(color: Colors.blue, width: 2))),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: SearchWidget(
              onSearch: (search) => setState(() {
                    listaPesquisa.add(search);
                  })),
        ),
      ),
    );
  }
}
