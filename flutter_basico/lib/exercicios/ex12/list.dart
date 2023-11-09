import 'package:exercicios_flutter_basico/exercicios/ex12/confirm.dart';
import 'package:flutter/material.dart';

class ListNames extends StatefulWidget {
  const ListNames({super.key});

  @override
  State<ListNames> createState() => _ListNamesState();
}

class _ListNamesState extends State<ListNames> {
  List<String> nameList = ['João', 'José', 'Josias', 'Josevaldo', 'Teste'];

  @override
  Widget build(BuildContext context) {
    void goToDelete(index) async {
      final result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ConfirmDelete(nome: nameList[index]),
      ));

      if (!mounted) return;

      if (result != null && result) {
        setState(() => nameList.removeAt(index));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercício 12'),
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => ListTile(
          title: Text(nameList[index]),
          trailing: IconButton(
              onPressed: () => goToDelete(index),
              icon: const Icon(
                Icons.delete_forever,
                color: Color.fromARGB(255, 252, 97, 97),
              )),
          contentPadding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
        ),
        itemCount: nameList.length,
      ),
      bottomNavigationBar: IconButton(
        icon: const Icon(
          Icons.refresh,
          color: Color.fromARGB(255, 136, 136, 136),
        ),
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const ListNames(),
        )),
        iconSize: 30,
      ),
    );
  }
}
