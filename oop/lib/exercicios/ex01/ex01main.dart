import 'classe_contacorrente.dart';

void main() {
  ContaCorrente conta1 = ContaCorrente(5000);
  conta1.exibirSaldo();
  conta1.sacar(5500);
  conta1.depositar(600);
  conta1.sacar(5500);
  conta1.exibirSaldo();
  //print(conta1._fmt(999));
  //conta1._saldoAtual = 200;
  conta1.exibirSaldo();
}