class MediaNotasModel {
  List<double> listaNotas;

  MediaNotasModel({required this.listaNotas});

  double calcularMedia() {
    if (listaNotas.isEmpty) return 0;

    double total = listaNotas.reduce((value, element) {
      double v1 = (value > 0 ? value : 0);
      double v2 = (element > 0 ? element : 0);
      return v1 + v2;
    });
    return double.parse((total / listaNotas.length).toStringAsFixed(1));
  }
}
