const String LISTA_ITEM_TABLE = "listaItem";
const String LISTA_ITEM_ID = "id";
const String LISTA_ITEM_ITEM = "item";
const String LISTA_ITEM_COMPRADO = "comprado";

class ListaItemModel {
  int? id;
  String item = "";
  bool comprado = false;

  ListaItemModel({this.id, required this.item, required this.comprado});

  // Serialização
  ListaItemModel.fromJson(Map<String, dynamic> json) {
    id = json[LISTA_ITEM_ID];
    item = json[LISTA_ITEM_ITEM];
    comprado = json[LISTA_ITEM_COMPRADO] == 1;
  }

  // Deserialização
  Map<String, dynamic> toJson() {
    Map<String, dynamic> result = {
      LISTA_ITEM_ITEM: item,
      LISTA_ITEM_COMPRADO: (comprado ? 1 : 0)
    };

    if (id != null)
      result[LISTA_ITEM_ID] = id;

    return result;
  }
}
