
import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

import 'package:consulta_cep_flutter/services/CEPService.dart';
import 'package:consulta_cep_flutter/exceptions/api-invalida-exception.dart';
import 'package:consulta_cep_flutter/exceptions/cep-nao-encontrado-exception.dart';

void main() {
  group('Testes do serviço de CEP', () {
    test('Retorna endereço quando CEP existe', () async {
      final cliente = MockClient((request) async {
        return http.Response(
          jsonEncode({
            'cep': '17500-000',
            'logradouro': 'Rua Exemplo',
            'unidade': '',
            'bairro': 'Centro',
            'localidade': 'Marília',
            'uf': 'SP',
            'estado': 'São Paulo',
            'regiao': 'Sudeste',
            'ibge': '3529005',
            'gia': '',
            'ddd': '14',
            'siafi': '',
          }),
          200,
          headers: {'content-type': 'application/json'},
        );
      });

      final servico = CEPService(cliente: cliente);

      final endereco =
          await servico.consultar('17500000');

      expect(endereco.cep, '17500-000');
      expect(endereco.localidade, 'Marília');
      expect(endereco.uf, 'SP');

      cliente.close();
    });

    test('Lança exceção quando CEP não existe', () async {
      final cliente = MockClient((request) async {
        return http.Response(
          '{"erro": true}',
          200,
        );
      });

      final servico = CEPService(cliente: cliente);

      await expectLater(
        servico.consultar('99999999'),
        throwsA(isA<CepNaoEncontradoException>()),
      );

      cliente.close();
    });

    test('Lança exceção quando API retorna erro 500',
        () async {
      final cliente = MockClient((request) async {
        return http.Response(
          'Erro interno',
          500,
        );
      });

      final servico = CEPService(cliente: cliente);

      await expectLater(
        servico.consultar('17500000'),
        throwsA(isA<ApiInvalidaException>()),
      );

      cliente.close();
    });
  });
}
