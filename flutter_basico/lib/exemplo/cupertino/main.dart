import 'package:flutter/cupertino.dart';

void main() {
  runApp(const Cupertino());
}

class Cupertino extends StatelessWidget {
  const Cupertino({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
        theme: CupertinoThemeData(
            brightness: Brightness.light,
            barBackgroundColor: CupertinoColors.lightBackgroundGray),
        home: Home());
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text("Cupertino Nav Bar")),
      child: SafeArea(child: Text('Pagina Inicial')),
    );
  }
}
