import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:exercicio03/main.dart' as app;

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('Teste do aplicativo exercicio03', () {
    testWidgets('1- Login: Entrar e Sair', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_usuario")), 'teste');
      await Future.delayed(const Duration(seconds: 1));

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_senha")), '1234');
      await Future.delayed(const Duration(seconds: 1));

      await widgetTester.tap(find.text('Login'));
      await widgetTester.pumpAndSettle();

      expect(find.text('Página inicial'), findsOneWidget);

      await Future.delayed(const Duration(seconds: 2));
      await widgetTester.tap(find.byIcon(Icons.logout));
      await widgetTester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 1));

      expect(find.text('Login'), findsOneWidget);
    });

    testWidgets('2- Login: Usuário/senha inválido', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_usuario")), 'test');
      await Future.delayed(const Duration(seconds: 1));

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_senha")), '1234');
      await Future.delayed(const Duration(seconds: 1));

      await widgetTester.tap(find.text('Login'));
      await widgetTester.pumpAndSettle();

      expect(find.text('Usuário/Senha inválido'), findsOneWidget);
    });

    testWidgets('3- Login: Entrar e clicar no botão adicionar 10x', (widgetTester) async {
      app.main();

      await widgetTester.pumpAndSettle();

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_usuario")), 'teste');
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.enterText(find.byKey(const ValueKey<String>("form_input_senha")), '1234');
      await Future.delayed(const Duration(seconds: 2));

      await widgetTester.tap(find.text('Login'));
      await widgetTester.pumpAndSettle();

      expect(find.text('Página inicial'), findsOneWidget);

      for (int i = 0; i < 10; i++) {
        await widgetTester.tap(find.byIcon(Icons.add));
        await widgetTester.pumpAndSettle();
      }

      final listaScroll = find.byType(Scrollable);
      final itemProcurado = find.text('Item 15');

      await widgetTester.scrollUntilVisible(itemProcurado, 20, scrollable: listaScroll);

      expect(itemProcurado, findsOneWidget);
    });
  });
}
