import 'package:calculadora/providers/calculadora_store.dart';
import 'package:flutter/material.dart';

class OperacaoButtonWidget extends StatelessWidget {
  final Operacoes operacao;
  final CalculadoraStore calc;

  const OperacaoButtonWidget(
      {required this.operacao, required this.calc, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: calc.isOperacao(operacao)
            ? const MaterialStatePropertyAll(Colors.blue)
            : const MaterialStatePropertyAll(Colors.grey),
      ),
      onPressed: () => calc.selecionarOperacao(operacao),
      child: Text(operacao.name),
    );
  }
}
