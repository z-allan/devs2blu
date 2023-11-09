import 'package:dart_avancado/exercicios/ex01/repositories/universidade_api.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Universidades BR'),
      ),
      body: FutureBuilder(
        future: UniversidadeRepository.getUniversidades(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          int longestString =
              UniversidadeRepository.longestString(snapshot.data!);
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                    '${snapshot.data![index].nome.toString().padRight(longestString)} = ${snapshot.data![index].site.toString()}',
                    style: GoogleFonts.anonymousPro(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.w500)),
              );
            },
          );
        },
      ),
    );
  }
}
