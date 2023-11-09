import 'package:exercicios_flutter_basico/exemplo/calculadora/main.dart';
import 'package:exercicios_flutter_basico/exemplo/paineis/main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex01/ex01main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex02/ex02main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex03/ex03main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex04/ex04main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex05/ex05main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex06/ex06main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex07/ex07main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex08/ex08main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex09/ex09main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex10/ex10main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex11/ex11main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex12/ex12main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex13/ex13main.dart';
import 'package:exercicios_flutter_basico/exercicios/ex14/ex14main.dart';
import 'package:flutter/material.dart';

final List<MyRoutes> _exList = [
  MyRoutes(url: 'indice', route: const Indice()),
  MyRoutes(url: 'calculadora', route: const MyApp()),
  MyRoutes(url: 'paineis', route: const Exemplo()),
  MyRoutes(url: 'exercicio01', route: const Exercicio01(backButton: true)),
  MyRoutes(url: 'exercicio02', route: const Exercicio02()),
  MyRoutes(url: 'exercicio03', route: const Exercicio03()),
  MyRoutes(url: 'exercicio04', route: const Exercicio04()),
  MyRoutes(url: 'exercicio05', route: const Exercicio05()),
  MyRoutes(url: 'exercicio06', route: const Exercicio06()),
  MyRoutes(url: 'exercicio07', route: const Exercicio07()),
  MyRoutes(url: 'exercicio08', route: const Exercicio08()),
  MyRoutes(url: 'exercicio09', route: const Exercicio09()),
  MyRoutes(url: 'exercicio10', route: const Exercicio10()),
  MyRoutes(url: 'exercicio11', route: const Exercicio11()),
  MyRoutes(url: 'exercicio12', route: const Exercicio12()),
  MyRoutes(url: 'exercicio13', route: const Exercicio13()),
  MyRoutes(url: 'exercicio14', route: const Exercicio14()),
];

void main() {
  runApp(const IndiceExercicios());
}

class IndiceExercicios extends StatelessWidget {
  const IndiceExercicios({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: 'indice',
        routes: MyRoutes.getRoute(_exList),
        debugShowCheckedModeBanner: false);
  }
}

class Indice extends StatefulWidget {
  const Indice({super.key});

  @override
  State<Indice> createState() => _IndiceState();
}

class _IndiceState extends State<Indice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Lista de Exercícios')),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: _exList.length - 1,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: const Icon(Icons.logo_dev),
              title: Text(_exList[index + 1].url),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).pushNamed(_exList[index + 1].url);
              },
            );
          }),
    );
  }
}

class MyRoutes {
  late String url;
  late WidgetBuilder route;

  MyRoutes({required this.url, required route}) {
    this.route = (context) => route;
  }

  static Map<String, WidgetBuilder> getRoute(List<MyRoutes> pList) {
    Map<String, WidgetBuilder> tempMap = {};
    for (MyRoutes item in pList) {
      tempMap.addAll({item.url: item.route});
    }
    return tempMap;
  }
}
