import 'package:dart_avancado/exercicios/ex02e03/models/giphy_gif.dart';
import 'package:dart_avancado/exercicios/ex02e03/repositories/giphy_api.dart';
import 'package:dart_avancado/exercicios/ex02e03/widgets/giphy_gif_image.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool isPesquisa = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _mensagemAppBar(),
          automaticallyImplyLeading: true,
          actions: [_iconeAppBar()]),
      body: FutureBuilder(
        future: _isPesquisaOrTrending(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (!snapshot.hasData || snapshot.connectionState.name == 'waiting') {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.data == null || snapshot.data!.length == 0) {
              return Center(
                child: Text(
                    "Nenhum registro encontrado para '${_searchController.text}'"),
              );
            }
          }

          return GridView.builder(
            itemCount: snapshot.data!.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            itemBuilder: (context, index) {
              return GiphyGifImage(giphyGif: snapshot.data![index]);
            },
          );
        },
      ),
    );
  }

  Widget _mensagemAppBar() {
    if (isPesquisa) {
      return Text('Pesquisando: ${_searchController.text}');
    }
    return Text('GIFs em Trending');
  }

  Widget _iconeAppBar() {
    if (isPesquisa) {
      return IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          setState(() {
            isPesquisa = false;
            _searchController.clear();
          });
        },
      );
    }
    return IconButton(
      icon: Icon(Icons.search),
      onPressed: () {
        _showSearchDialog(context);
      },
    );
  }

  Future<List<GiphyGifModel>> _isPesquisaOrTrending() async {
    if (isPesquisa) {
      return await GiphyRepository.getSearchGifs(_searchController.text);
    }
    return await GiphyRepository.getTrendingGifs();
  }

  void _realizarPesquisa() {
    if (!_searchController.text.trim().isEmpty) {
      setState(() => isPesquisa = true);
      Navigator.of(context).pop();
    }
  }

  void _showSearchDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          icon: Icon(
            Icons.search,
            size: 50,
            color: Colors.grey,
          ),
          alignment: Alignment.topCenter,
          title: Text('Insira abaixo sua pesquisa'),
          content: SizedBox(
            height: 120,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextField(
                  onSubmitted: (value) => _realizarPesquisa(),
                  autofocus: true,
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'O que pesquisar?',
                  )),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(250, 40))),
                  onPressed: () {
                    _realizarPesquisa();
                  },
                  child: Text('Pesquisar'),
                ),
              )
            ]),
          ),
        );
      },
    );
  }
}
