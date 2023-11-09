import 'package:flutter/material.dart';
import 'package:sw_riverpod/models/sw_people_model.dart';

class PersonTileWidget extends StatelessWidget {
  final StarWarsPeopleModel peopleModel;

  const PersonTileWidget({required this.peopleModel, super.key});

  @override
  Widget build(BuildContext context) {
    String altura = '';

    try {
      altura = "${(int.parse(peopleModel.height) / 100).toStringAsFixed(2)}m";
    } on Exception {
      altura = "N/A";
    }

    return ListTile(
      title: Text(
        peopleModel.name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(peopleModel.gender,
          style: TextStyle(
              color: peopleModel.gender == 'male'
                  ? Colors.lightBlue[800]
                  : peopleModel.gender == 'female'
                      ? Colors.red[800]
                      : Colors.amber[800])),
      trailing: Text(altura),
    );
  }
}
