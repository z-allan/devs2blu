import 'package:flutter/material.dart';

class MyEvents extends StatefulWidget {
  const MyEvents({super.key});

  @override
  State<MyEvents> createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<String> listaEvento = [
    'João Nogueira',
    'Maria da Silva',
    'Allan Zimmermann',
    'Tom Hanks',
    'Juscreuza Jerusa'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Evento: Teste')),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: listaEvento.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.person_4_rounded),
              title: Text(listaEvento[index]),
              subtitle: const Text('Clique aqui para editar'),
              trailing: const Icon(Icons.more_vert),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Clicou em '${listaEvento[index]}'")),
                );
              },
            );
          }),
    );
  }
}
