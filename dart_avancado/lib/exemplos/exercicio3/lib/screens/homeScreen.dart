import "package:flutter/material.dart";
import "../repositories/tenorGifRepository.dart";
import "../widgets/tenorGifImage.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool inSearch = false;
  String currentSearch = "";

  AppBar _getAppBar() {
    if (inSearch)
      return AppBar(
        title: Expanded(
          child: TextField(
            onSubmitted: (value) {
              if (value.isEmpty) return;

              setState(() {
                currentSearch = value;
              });
            },
            decoration: InputDecoration(
                labelText: "Digite aqui sua pesquisa e clique em Pesquisar"),
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  inSearch = false;
                });
              },
              icon: Icon(
                Icons.cancel_outlined,
                color: Colors.red,
              ))
        ],
      );

    return AppBar(
      title: Text("Tenor: Página inicial"),
      actions: [
        IconButton(
            onPressed: () {
              setState(() {
                inSearch = true;
              });
            },
            icon: Icon(Icons.search))
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: FutureBuilder(
        future: (this.currentSearch.isEmpty
            ? TenorGifRepository.getTrendingGifs()
            : TenorGifRepository.search(currentSearch, 30)),
        builder: (context, snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());

          if ((!snapshot.hasData) ||
              (snapshot.connectionState == ConnectionState.waiting))
            return CircularProgressIndicator();

          return GridView.builder(
              itemCount: snapshot.data!.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return TenorGifImage(tenorGif: snapshot.data![index]);
              });
        },
      ),
    );
  }
}
