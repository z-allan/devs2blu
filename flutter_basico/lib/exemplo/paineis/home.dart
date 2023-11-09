import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Exemplo'), centerTitle: true),
      body: Center(
          child: Column(children: [
        Expanded(
          flex: 2,
          child: Row(children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        color: Colors.amber,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Teste 1',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                        alignment: Alignment.bottomCenter,
                        color: const Color.fromRGBO(200, 200, 200, 1),
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Teste 2',
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                        blurRadius: 20,
                                        color: Colors.grey,
                                        offset: Offset(0, -15))
                                  ])),
                        )),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.black,
                  child: const Center(
                    child: Text('Teste 3',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            decoration: TextDecoration.lineThrough)),
                  )),
            )
          ]),
        ),
        Expanded(
          flex: 1,
          child: Row(children: [
            Expanded(
              flex: 1,
              child: Container(
                  color: Colors.blueGrey.shade800,
                  alignment: Alignment.centerRight,
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Teste 4',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  )),
            ),
            Expanded(
              flex: 4,
              child: Container(
                  color: Colors.deepOrangeAccent,
                  alignment: Alignment.bottomRight,
                  child: const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(
                      'Teste 5',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          shadows: [
                            Shadow(
                                color: Colors.black,
                                blurRadius: 15,
                                offset: Offset(10, 10))
                          ]),
                    ),
                  )),
            )
          ]),
        ),
      ])),
    );
  }
}
