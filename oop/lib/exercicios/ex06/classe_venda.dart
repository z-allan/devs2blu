import 'classe_membro.dart';

class VendaIngresso {

  late String nomeEvento;
  late DateTime dataVenda;
  late MembroClube _membroComprador;

  VendaIngresso({required this.nomeEvento, required this.dataVenda, required comprador}){
    _membroComprador = comprador;
  }

  MembroClube get comprador => MembroClube.copy(_membroComprador);

  @override
  String toString() {
    return "${_membroComprador.nome} (${_membroComprador.aniversarioHoje}) comprou ingresso para o evento '$nomeEvento' no dia ${_formataData()} as ${_formataHora()}.";
  }

  String _formataData() {
    String mes = dataVenda.month < 10 ? '0${dataVenda.month}' : '${dataVenda.month}';
    String dia = dataVenda.day < 10 ? '0${dataVenda.day}' : '${dataVenda.day}';
    return "$dia/$mes/${dataVenda.year}";
  }

  String _formataHora() {
    String hora = dataVenda.hour < 10 ? '0${dataVenda.hour}' : '${dataVenda.hour}';
    String minuto = dataVenda.minute < 10 ? '0${dataVenda.minute}' : '${dataVenda.minute}';
    String segundo = dataVenda.second < 10 ? '0${dataVenda.second}' : '${dataVenda.second}';
    return "$hora:$minuto:$segundo";
  }
}