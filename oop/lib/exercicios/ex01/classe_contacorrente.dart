class ContaCorrente {

  double _saldoAtual = 0;

  ContaCorrente(double saldo) {
    _saldoAtual = saldo;
  }

  void depositar(double pValor) {
    _saldoAtual += pValor;
    print('Depósito de ${_fmt(pValor)} efetuado com sucesso.');
  }

  void sacar(double pValor) {
    if (pValor > _saldoAtual) {
      print('Não é possível sacar este valor (${_fmt(pValor)}).');
    } else {
      _saldoAtual -= pValor;
      print('Saque de ${_fmt(pValor)} efetuado com sucesso.');
    }
  }

  void exibirSaldo() {
    print('Seu saldo é de ${_fmt(_saldoAtual)}');
  }

  String _fmt(double pValor) {
    return 'R\$ ${pValor.toStringAsFixed(2)}';
  }
}

void main() {
  ContaCorrente conta1 = ContaCorrente(5000);
  conta1.exibirSaldo();
  conta1.sacar(5500);
  conta1.depositar(600);
  conta1.sacar(5500);
  conta1.exibirSaldo();
  print(conta1._fmt(999));  //quando o main está dentro do arquivo da class
  conta1._saldoAtual = 200; //eu consigo acessar os métodos/atributos privados
  conta1.exibirSaldo();
}