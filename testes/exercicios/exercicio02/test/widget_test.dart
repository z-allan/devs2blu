// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:exercicio02/models/pergunta_model.dart';
import 'package:exercicio02/screens/pergunta_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  PerguntaModel perguntaModel = PerguntaModel(pergunta: 'Qual maior rio do mundo (em extensão)?', respostas: [
    {'opcao': 'Rio Amazonas', 'correta': true},
    {'opcao': 'Rio Nilo', 'correta': false},
    {'opcao': 'Rio Missisipi', 'correta': false},
    {'opcao': 'Rio Paraná', 'correta': false},
  ]);

  Color? corPrimaria = Colors.grey;
  Color? corCerto = Colors.green;
  Color? corErrado = Colors.red;

  testWidgets('Verificar se todas as opções foram renderizadas', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PerguntaScreen(perguntaModel: perguntaModel)));

    var corContainer = ((tester.firstWidget(find.byType(Container)) as Container).decoration as BoxDecoration).color;

    expect(find.byType(ElevatedButton), findsNWidgets(perguntaModel.respostas.length));
    expect(find.textContaining('Responda'), findsOneWidget);
    expect(corContainer, corPrimaria);
  });

  testWidgets('Verificar se existe um texto com a pergunta em tela', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PerguntaScreen(perguntaModel: perguntaModel)));

    var corContainer = ((tester.firstWidget(find.byType(Container)) as Container).decoration as BoxDecoration).color;

    expect(find.text(perguntaModel.pergunta), findsOneWidget);
    expect(find.textContaining('Responda'), findsOneWidget);
    expect(corContainer, corPrimaria);
  });

  testWidgets('Testar a resposta correta da pergunta', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PerguntaScreen(perguntaModel: perguntaModel)));

    await tester.tap(find.text(perguntaModel.respostas[0]['opcao']));
    await tester.pump();

    var corContainerCerto =
        ((tester.firstWidget(find.byType(Container)) as Container).decoration as BoxDecoration).color;

    expect(find.text('Certo'), findsOneWidget);
    expect(find.text('Errado'), findsNothing);
    expect(find.textContaining('Responda'), findsNothing);
    expect(corContainerCerto, corCerto);
  });

  testWidgets('Testar uma opção errada da pergunta', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PerguntaScreen(perguntaModel: perguntaModel)));

    await tester.tap(find.text(perguntaModel.respostas[1]['opcao']));
    await tester.pumpAndSettle();

    var corContainerErrado =
        ((tester.firstWidget(find.byType(Container)) as Container).decoration as BoxDecoration).color;

    expect(find.text('Certo'), findsNothing);
    expect(find.text('Errado'), findsOneWidget);
    expect(find.textContaining('Responda'), findsNothing);
    expect(corContainerErrado, corErrado);
  });

  testWidgets('Testar a cor das respostas', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PerguntaScreen(perguntaModel: perguntaModel)));

    await tester.tap(find.text(perguntaModel.respostas[0]['opcao']));
    await tester.pump();

    for (int i = 0; i < perguntaModel.respostas.length; i++) {
      var cor = ((tester.widget(find.text(perguntaModel.respostas[i]['opcao'])) as Text).style as TextStyle).color;
      var corEsperada = perguntaModel.respostas[i]['correta'] ? corCerto : corErrado;
      expect(cor, corEsperada);
    }
  });
}
