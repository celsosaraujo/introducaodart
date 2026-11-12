
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../exceptions/api-invalida-exception.dart';
import '../exceptions/cep-nao-encontrado-exception.dart';
import '../models/endereco.dart';

class CEPService {
  final http.Client cliente;

  CEPService({http.Client? cliente})
      : cliente = cliente ?? http.Client();

  Future<Endereco> consultar(String cep) async {
    final url = Uri.parse(
      'https://viacep.com.br/ws/$cep/json/',
    );

    late http.Response resposta;

    try {
      resposta = await cliente.get(url);
    } catch (e) {
      throw ApiInvalidaException("Erro na url: $e");
    }

    if (resposta.statusCode == 200) {
      final dados =
          jsonDecode(resposta.body) as Map<String, dynamic>;

      if (dados['erro'] == true) {
        throw CepNaoEncontradoException();
      }

      return Endereco.deJson(dados);
    }

    throw ApiInvalidaException(
      "Erro na busca do endereço: ${resposta.statusCode}",
    );
  }
}
