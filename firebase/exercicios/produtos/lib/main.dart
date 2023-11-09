import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:produtos/firebase_options.dart';
import 'package:produtos/screen/home_screen.dart';
import 'package:produtos/stores/produto_lista_store.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const Produtos());
}

class Produtos extends StatelessWidget {
  const Produtos({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<ProdutoListaStore>(
      create: (context) => ProdutoListaStore(),
      child: MaterialApp(
        theme: ThemeData.dark(useMaterial3: true),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
