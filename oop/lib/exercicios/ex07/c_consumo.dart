class CalculaConsumoMedia {
  double qtdCombTotal = 0;
  double qtdCombAtual = 0;
  double qtdKmPercorrida = 0;

  CalculaConsumoMedia(this.qtdCombTotal, this.qtdCombAtual, this.qtdKmPercorrida);

  void calcularMedia() {
    double litrosUsados = qtdCombTotal-qtdCombAtual;
    if (litrosUsados <= 0) {
      print('Não foi possível calcular a média.');
      return;
    }
    double media = qtdKmPercorrida / litrosUsados;
    print('Média de ${media.toStringAsFixed(1)}km/l.');
  }
}