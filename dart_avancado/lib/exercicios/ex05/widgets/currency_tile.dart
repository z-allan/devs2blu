import 'package:dart_avancado/exercicios/ex05/model/currency_model.dart';
import 'package:flutter/material.dart';

class CurrencyTileWidget extends StatelessWidget {
  final CurrencyModel model;

  const CurrencyTileWidget({required this.model, super.key});

  @override
  Widget build(BuildContext context) {
    double percVar = double.parse(model.variaton);

    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom:
                  BorderSide(color: Theme.of(context).dividerColor, width: 2))),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: ListTile(
          title: Text('${model.coin1}/${model.coin2}',
              style: TextStyle(
                  color: (percVar >= 0) ? Colors.green : Colors.red,
                  fontSize: 16,
                  fontWeight: FontWeight.bold)),
          isThreeLine: true,
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(model.description),
              Text('High: ${model.high} Low: ${model.low}'),
              Text('Last trade: ${model.lastTrade}'),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${percVar.toStringAsFixed(2)}%',
                style: TextStyle(
                    color: (percVar >= 0) ? Colors.green : Colors.red,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
