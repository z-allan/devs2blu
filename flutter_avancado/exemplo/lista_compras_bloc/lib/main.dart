import "package:bloc_pattern/bloc_pattern.dart";
import "package:flutter/material.dart";
import "package:lista_compras_bloc/bloc/lista_item_bloc.dart";
import "package:lista_compras_bloc/screens/home_screen.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          home: HomeScreen(),
        ),
        blocs: [Bloc((i) => ListaItemBloc())],
        dependencies: []);
  }
}
