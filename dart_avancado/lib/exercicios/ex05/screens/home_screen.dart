import 'package:dart_avancado/exercicios/ex05/widgets/currency_tile.dart';
import 'package:dart_avancado/exercicios/ex05/widgets/list_inherited.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Exercício 05')),
      body: StreamBuilder(
        initialData: CurrencyListWidget.of(context)!.currencyList,
        stream: CurrencyListWidget.of(context)!.stream,
        builder: (context, snapshot) {
          if (snapshot.hasError)
            return Center(
              child: Text(snapshot.error.toString(),
                  style: TextStyle(color: Colors.red)),
            );

          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.currencies.length,
            itemBuilder: (context, index) {
              return CurrencyTileWidget(
                  model: snapshot.data!.currencies[index]);
            },
          );
        },
      ),
      bottomNavigationBar: StreamBuilder(
        stream: CurrencyListWidget.of(context)!.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return SizedBox(width: 40, child: CircularProgressIndicator());

          return Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(blurRadius: 7, blurStyle: BlurStyle.outer)
            ], color: Theme.of(context).appBarTheme.backgroundColor),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  CurrencyListWidget.of(context)!.currencyList.lastUpdate,
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).appBarTheme.foregroundColor),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
