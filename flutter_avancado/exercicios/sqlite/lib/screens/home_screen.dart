import 'package:flutter/material.dart';
import 'package:sqlite/repositories/db_sqlite_queries.dart';
import 'package:sqlite/widgets/add_item_bar.dart';
import 'package:sqlite/widgets/checkbox_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool showAll = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
      ),
      body: FutureBuilder(
        future: showAll ? SQLiteQuery.getAll() : SQLiteQuery.getPending(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Padding(
                padding: EdgeInsets.all(32.0),
                child: SizedBox(
                    width: double.infinity,
                    child: Text('No Data', textAlign: TextAlign.center)));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return CheckBoxTileWidget(
                comprasModel: snapshot.data![index],
                onChange: () => setState(() {}),
              );
            },
          );
        },
      ),
      bottomNavigationBar: AddItemWidget(
        onChange: (show) {
          this.showAll = show;
          setState(() {});
        },
      ),
    );
  }
}
