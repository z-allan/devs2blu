import 'package:dart_avancado/exemplos/pokemon/repositories/pokemon_api.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pokemon'),
      ),
      body: FutureBuilder(
        future: PokemonRepository.getPokemons(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    '${index + 1} - ${snapshot.data![index].name.toString()} - ${snapshot.data![index].url.toString()}'),
              );
            },
          );
        },
      ),
    );
  }
}
