
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:consulta_cep_flutter/views/endereco-view.dart';

void main() {
  // Inicializa a tela do aplicativo para cada teste.
  Future<void> abrirTela(WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: EnderecoView(),
      ),
    );

    await tester.pump();
  }

  group('Testes da interface - Consulta CEP', () {

    // -------------------------------------------------
    // CT01 - Verificar componentes da tela
    // -------------------------------------------------
    testWidgets('CT01 - Exibe os componentes da tela',
        (WidgetTester tester) async {

      await abrirTela(tester);

      expect(
        find.text('Consulta CEP'),
        findsOneWidget,
      );

      expect(
        find.byType(TextField),
        findsOneWidget,
      );

      expect(
        find.text('Consultar'),
        findsOneWidget,
      );

      expect(
        find.text('Limpar'),
        findsOneWidget,
      );
    });

    // -------------------------------------------------
    // CT02 - Digitar um CEP
    // -------------------------------------------------
    testWidgets('CT02 - Permite digitar um CEP',
        (WidgetTester tester) async {

      await abrirTela(tester);

      final campoCEP = find.byType(TextField);

      await tester.enterText(
        campoCEP,
        '17500000',
      );

      await tester.pump();

      final campo = tester.widget<TextField>(campoCEP);

      expect(
        campo.controller!.text,
        '17500000',
      );
    });

    // -------------------------------------------------
    // CT03 - CEP não informado
    // -------------------------------------------------
    testWidgets('CT03 - Exibe erro para CEP vazio',
        (WidgetTester tester) async {

      await abrirTela(tester);

      final botaoConsultar = find.text('Consultar');

      expect(
        botaoConsultar,
        findsOneWidget,
      );

      await tester.ensureVisible(botaoConsultar);

      await tester.tap(botaoConsultar);

      await tester.pump();

      expect(
        find.textContaining('CEP não informado'),
        findsOneWidget,
      );
    });

    // -------------------------------------------------
    // CT04 - CEP incompleto
    // -------------------------------------------------
    testWidgets('CT04 - Exibe erro para CEP incompleto',
        (WidgetTester tester) async {

      await abrirTela(tester);

      final campoCEP = find.byType(TextField);

      await tester.enterText(
        campoCEP,
        '17500',
      );

      await tester.pump();

      final botaoConsultar = find.text('Consultar');

      expect(
        botaoConsultar,
        findsOneWidget,
      );

      await tester.ensureVisible(botaoConsultar);

      await tester.tap(botaoConsultar);

      await tester.pump();

      expect(
        find.textContaining('CEP inválido'),
        findsOneWidget,
      );
    });

    // -------------------------------------------------
    // CT05 - Limpar o campo utilizando o botão Limpar
    // -------------------------------------------------
    testWidgets('CT05 - Botão Limpar apaga o CEP',
        (WidgetTester tester) async {

      await abrirTela(tester);

      final campoCEP = find.byType(TextField);

      await tester.enterText(
        campoCEP,
        '17500000',
      );

      await tester.pump();

      final botaoLimpar = find.text('Limpar');

      expect(
        botaoLimpar,
        findsOneWidget,
      );

      await tester.ensureVisible(botaoLimpar);

      await tester.tap(botaoLimpar);

      await tester.pump();

      final campo = tester.widget<TextField>(campoCEP);

      expect(
        campo.controller!.text,
        isEmpty,
      );
    });

    // -------------------------------------------------
    // CT06 - Limpar o CEP utilizando o ícone X
    // -------------------------------------------------
    testWidgets('CT06 - Ícone X limpa o CEP',
        (WidgetTester tester) async {

      await abrirTela(tester);

      final campoCEP = find.byType(TextField);

      await tester.enterText(
        campoCEP,
        '17500000',
      );

      await tester.pump();

      final botaoLimpar = find.byIcon(
        Icons.close_rounded,
      );

      expect(
        botaoLimpar,
        findsOneWidget,
      );

      await tester.ensureVisible(botaoLimpar);

      await tester.tap(botaoLimpar);

      await tester.pump();

      final campo = tester.widget<TextField>(campoCEP);

      expect(
        campo.controller!.text,
        isEmpty,
      );
    });

  });
}
