import 'package:calculadora/providers/calculadora_store.dart';
import 'package:calculadora/widgets/operacao_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class HomeScreen extends StatelessWidget {
  final calc = CalculadoraStore();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Scaffold(
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.red, Colors.amber, Colors.green, Colors.pink],
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              height: 350,
              width: 375,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OperacaoButtonWidget(
                            operacao: Operacoes.Somar, calc: calc),
                        OperacaoButtonWidget(
                            operacao: Operacoes.Subtrair, calc: calc),
                        OperacaoButtonWidget(
                            operacao: Operacoes.Multiplicar, calc: calc),
                        OperacaoButtonWidget(
                            operacao: Operacoes.Dividir, calc: calc),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(labelText: 'Valor1'),
                      onChanged: (value) => calc.setValor1(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: const InputDecoration(labelText: 'Valor2'),
                      onChanged: (value) => calc.setValor2(value),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      calc.resultado,
                      style: const TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
          ),
        ]),
      );
    });
  }
}
