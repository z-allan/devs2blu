class FolhaSalarial {
  late double valorHora;
  late double horasTrabalhadas;

  FolhaSalarial([this.valorHora=0.0, this.horasTrabalhadas=0.0]);

  double valorAReceber() {
    return valorHora * horasTrabalhadas;
  }
}
