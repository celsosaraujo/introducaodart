
import 'package:flutter_test/flutter_test.dart';

import '../lib/controllers/endereco-controller.dart';
import '../lib/exceptions/cep-invalido-exception.dart';
import '../lib/exceptions/cep-nao-informado-exception.dart';

void main() {
  late EnderecoController controller;

  setUp(() {
    controller = EnderecoController();
  });

  group('Validação de CEP', () {
    test('Aceita CEP com oito números', () {
      expect(controller.validaCEP('17500000'), '17500000');
    });

    test('Remove o hífen do CEP', () {
      expect(controller.validaCEP('17500-000'), '17500000');
    });

    test('Remove espaços do CEP', () {
      expect(controller.validaCEP('17500 000'), '17500000');
    });

    test('Rejeita CEP incompleto', () {
      expect(
        () => controller.validaCEP('17500'),
        throwsA(isA<CepInvalidException>()),
      );
    });

   test('Rejeita CEP vazio', () {
    expect(
      () => controller.validaCEP(''),
        throwsA(isA<CepNaoInformadoException>()),
    );
  });

    test('Rejeita CEP nulo', () {
      expect(
        () => controller.validaCEP(null),
        throwsA(isA<CepNaoInformadoException>()),
      );
    });

    test('Verifica comportamento com letras', () {
      expect(
        controller.validaCEP('abc17500000'),
        '17500000',
      );
    });
  });
}
