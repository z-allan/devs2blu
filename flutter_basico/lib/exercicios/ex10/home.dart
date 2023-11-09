import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)!.settings.arguments;
    int nrPag = (args == null) ? 1 : int.parse(args.toString());

    void onTap(int valor) {
      Navigator.of(context).pushReplacementNamed('/', arguments: valor);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercicio 10'),
      ),
      body: GestureDetector(
        onPanUpdate: (details) {
          if (details.delta.dx < 0) {
            onTap(++nrPag);
          }
          if (details.delta.dx > 0) {
            if (nrPag > 1) {
              onTap(--nrPag);
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
                flex: 6,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Página $nrPag',
                    style: const TextStyle(fontSize: 36),
                  ),
                )),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: nrPag == 1 ? null : () => onTap(--nrPag),
                        icon: const Icon(Icons.arrow_back)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: IconButton(
                        onPressed: () => onTap(++nrPag),
                        icon: const Icon(Icons.arrow_forward)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
