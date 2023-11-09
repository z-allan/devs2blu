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

          if ((snapshot.hasData) && (snapshot.data!.isEmpty))
            return Center(child: WidgetNoDataCreate());

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
    );
  }
}
