import "package:bloc_pattern/bloc_pattern.dart";
import "package:flutter/material.dart";
import "package:lista_compras_bloc/bloc/lista_item_bloc.dart";
import "package:lista_compras_bloc/models/lista_item_model.dart";
import "package:lista_compras_bloc/widgets/form_dialog_widget.dart";
import "package:lista_compras_bloc/widgets/lista_item_tile.dart";
import "package:lista_compras_bloc/widgets/widget_no_data_create.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          initialData: true,
          stream: BlocProvider.getBloc<ListaItemBloc>().showAllStream,
          builder: (context, snapshot) {
            bool value = false;

            if ((!snapshot.hasError) &&
                (snapshot.hasData) &&
                (snapshot.data != null)) value = snapshot.data!;

            return Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(
                    value: value,
                    onChanged: (value) =>
                        BlocProvider.getBloc<ListaItemBloc>().showAll = value ?? false),
                Text("Mostrar todos os itens")
              ],
            );
          },
        ),
      ),
      body: StreamBuilder(
        initialData: [],
        stream: BlocProvider.getBloc<ListaItemBloc>().listStream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString()),
            );

          if (!snapshot.hasData)
            return Center(
              child: CircularProgressIndicator(),
            );

          if ((snapshot.hasData) && (snapshot.data!.isEmpty)) {
            if (BlocProvider.getBloc<ListaItemBloc>().showAll) {
              return Center(child: WidgetNoDataCreate());
            } else {
              return Center(child: Text("Nenhum item para o filtro selecionado"),);
            }
          }


          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) =>
                  ListaItemTile(listaItemModel: snapshot.data![index]));
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => FormDialogWidget(
                  listaItemModel: ListaItemModel(item: "", comprado: false)));
        },
        child: Icon(Icons.add),
      ),
      bottomSheet: StreamBuilder(
        initialData: false,
        stream: BlocProvider.getBloc<ListaItemBloc>().concluidaStream,
        builder: (context, snapshot) {
          if ((snapshot.hasError) || (!snapshot.hasData))
            return Container(
              height: 0,
            );

          if (!(snapshot.data!))
            return Container(
              height: 0,
            );

          return Container(
            alignment: Alignment.centerLeft,
            height: 50,
            color: Colors.green,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.local_fire_department,
                    color: Colors.white,
                  ),
                ),
                Text(
                  "Lista concluída!",
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
