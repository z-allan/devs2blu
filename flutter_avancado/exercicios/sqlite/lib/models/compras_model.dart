const String COMPRAS_TABLENAME = "tb_compras";
const String COMPRAS_FIELDID = "id";
const String COMPRAS_FIELDITEM = "item";
const String COMPRAS_FIELDCOMPRADO = "comprado";

class ComprasModel {
  int? id = 0;
  late String item;
  late int comprado;

  ComprasModel({this.id, required this.item, required this.comprado});

  ComprasModel.fromJson(Map<String, dynamic> json) {
    this.id = json[COMPRAS_FIELDID];
    this.item = json[COMPRAS_FIELDITEM];
    this.comprado = json[COMPRAS_FIELDCOMPRADO];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {
      COMPRAS_FIELDITEM: this.item,
      COMPRAS_FIELDCOMPRADO: this.comprado
    };

    if (this.id != null) json[COMPRAS_FIELDID] = this.id;

    return json;
  }

  @override
  String toString() {
    return "Compras - ${this.id} | ${this.item} | ${this.comprado}";
  }
}
