import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TypeOper {add, subtract, multiply, divide}

class MyCalculator extends StatefulWidget {
    const MyCalculator({super.key});

    @override
    State<MyCalculator> createState() => _MyCalculatorState();
}


class _MyCalculatorState extends State<MyCalculator> {
    final Map<TypeOper, dynamic> _colors = {TypeOper.add:0,TypeOper.subtract:0,TypeOper.multiply:0,TypeOper.divide:0};
    String _result = '0.0';
    final int _decimal = 2;
    final TextEditingController _valor1 = TextEditingController();
    final TextEditingController _valor2 = TextEditingController();
    final int _corSelecionado = 0xFF90A4AE;
    final int _corNormal = 0xFFCFD8DC;

    _MyCalculatorState(){
        _colors.forEach((key, value) { _colors[key] = _corNormal; });
    }

    void _calcular(TypeOper type) {
        setState(() {
            _colors.forEach((key, value) {
                _colors[key] = (key == type) ? _corSelecionado : _corNormal;
            });
            try {
                double v1 = double.tryParse(_valor1.text.replaceAll(',', '.'))!;
                double v2 = double.tryParse(_valor2.text.replaceAll(',', '.'))!;
                switch (type) {
                    case TypeOper.add:
                    _result = (v1 + v2).toStringAsFixed(_decimal);
                    case TypeOper.subtract:
                    _result = (v1 - v2).toStringAsFixed(_decimal);
                    case TypeOper.multiply:
                    _result = (v1 * v2).toStringAsFixed(_decimal);
                    case TypeOper.divide:
                        if (v2 == 0) {
                            _result = 'ERROR ${String.fromCharCode(0x00F7)}0';
                            break;
                        }
                        _result = (v1 / v2).toStringAsFixed(_decimal);
                    default:
                    _result = '0.0';
                }
            } catch (e) {
                _result = 'ERROR';
            }
        });
    }

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('Exercício 4')),
            body: Center(
                child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    _MyNumberTextField(function: _valor1, width: 248, text: 'Valor 1'),
                    _MyNumberTextField(function: _valor2, width: 248, text: 'Valor 2'),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        _MyOutlinedButton(function: () => _calcular(TypeOper.add), type: '+', cor: _colors[TypeOper.add]!),
                        _MyOutlinedButton(function: () => _calcular(TypeOper.subtract), type: '-', cor: _colors[TypeOper.subtract]!),
                        _MyOutlinedButton(function: () => _calcular(TypeOper.multiply), type: 'x', cor: _colors[TypeOper.multiply]!),
                        _MyOutlinedButton(function: () => _calcular(TypeOper.divide), type: String.fromCharCode(0x00F7), cor: _colors[TypeOper.divide]!)
                    ]),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                            width: 250,
                            child: Text('= $_result',style: const TextStyle(fontSize: 32),
                            textAlign: TextAlign.right)
                        )
                    )
        ])));
    }
}

class _MyOutlinedButton extends StatelessWidget {
    final dynamic _function;
    final String _type;
    final int _cor;

    const _MyOutlinedButton(
    {required dynamic function, required String type, required int cor})
    : _type = type, _function = function, _cor = cor;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: OutlinedButton(onPressed: _function,
                style: ElevatedButton.styleFrom(backgroundColor: Color(_cor), foregroundColor: Colors.black),
                child: Text(_type)));
    }
}

class _MyNumberTextField extends StatelessWidget {
    final dynamic _function;
    final double _width;
    final String _text;

    const _MyNumberTextField(
    {required dynamic function, required double width, required String text})
    : _text = text, _width = width, _function = function;

    @override
    Widget build(BuildContext context) {
        return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('^[0-9]+(.[0-9]{0,2})?'))],
                textAlign: TextAlign.right,
                controller: _function,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    constraints: BoxConstraints(maxWidth: _width),
                labelText: _text)
            )
        );
    }
}
