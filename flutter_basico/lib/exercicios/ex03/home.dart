import 'package:flutter/material.dart';

class MyCounter extends StatefulWidget {
  const MyCounter({super.key});

  @override
  State<MyCounter> createState() => _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _counter = 0;

  void _increment() {
    setState(() => _counter++);
  }

  void _decrement() {
    setState(() => _counter--);
  }

  void _zerar() {
    setState(() => _counter = 0);
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Contador: $_counter',
              style: const TextStyle(fontSize: 30))),
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: 75,
                height: 50,
                child: ElevatedButton(
                    onPressed: _increment,
                    style: ButtonStyle(overlayColor:
                        MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.green;
                      }
                      return null;
                    })),
                    child: const Text('+')))),
        Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: 75,
                height: 50,
                child: ElevatedButton(
                    onPressed: _decrement,
                    style: ButtonStyle(overlayColor:
                        MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                      if (states.contains(MaterialState.pressed)) {
                        return Colors.red;
                      }
                      return null;
                    })),
                    child: const Text('-'))))
      ]),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
              width: 166,
              height: 35,
              child: OutlinedButton(
                  onPressed: _zerar, child: const Text('Zerar'))))
    ]);
  }
}
