import 'dart:async';

class ThreadModel {
  late double valorInicial;
  late double valorFinal;
  late double incrementarEm;
  late int sleepInMiliseconds;
  late String description;
  final StreamController<double> _streamController =
      StreamController<double>.broadcast();

  ThreadModel(
      {required this.valorInicial,
      required this.valorFinal,
      required this.incrementarEm,
      required this.sleepInMiliseconds,
      this.description = ''});

  static Future<String> contar(ThreadModel tm) async {
    final stopwatch = Stopwatch()..start();
    double i = 0;
    for (i = tm.valorInicial; i < tm.valorFinal; i += tm.incrementarEm) {
      await Future.delayed(Duration(milliseconds: tm.sleepInMiliseconds));
      print(
          '${stopwatch.elapsed} | ${tm.description} | ${i.toStringAsFixed(1)}');
    }
    stopwatch.stop();
    String tempoTotal = stopwatch.elapsed.toString();
    return tempoTotal.substring(2, tempoTotal.length - 3);
  }

  void contarStream() async {
    double i = 0;
    for (i = this.valorInicial; i < this.valorFinal; i += this.incrementarEm) {
      await Future.delayed(Duration(milliseconds: this.sleepInMiliseconds));
      _streamController.sink.add(i);
    }
  }

  Stream<double> get stream => _streamController.stream;
}
