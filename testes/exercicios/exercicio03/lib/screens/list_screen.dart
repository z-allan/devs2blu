import 'package:exercicio03/models/item_model.dart';
import 'package:exercicio03/models/lista_item_model.dart';
import 'package:exercicio03/screens/login_screen.dart';
import 'package:exercicio03/widgets/list_tile_widget.dart';
import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final listaItemModel = ListaItemModel();

  _ListScreenState() {
    listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
    listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
    listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
    listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
    listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página inicial'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => const LoginScreen(),
                ));
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.red,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: listaItemModel.getLista.length,
        itemBuilder: (context, index) {
          return ListaTileWidget(itemModel: listaItemModel.getLista[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          listaItemModel.addLista(ItemModel(nome: 'Item ${listaItemModel.getLista.length + 1}'));
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
