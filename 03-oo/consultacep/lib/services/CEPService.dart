import 'dart:convert';

import 'package:consultacep/exceptions/api-invalida-exception.dart';
import 'package:consultacep/exceptions/cep-nao-encontrado-exception.dart';
import 'package:consultacep/models/endereco.dart';
import 'package:http/http.dart' as http;


class CEPService{
  
  Future<Endereco> consultar(String cep) async {
    final url = Uri.parse('http://viacep.com.br/ws/$cep/json/');

    //declara a variável
    final resposta;
    try {
      // inicializa a variável
      resposta = await http.get(url);
    } catch (e) {
      // throw Exception("Erro na url: ${e.toString()}");
      throw ApiInvalidaException( "Erro na url: $e" );
    }

    //Status Code 200: Conseguiu consultar a API
    if (resposta.statusCode == 200) {
      Map<String, dynamic> cep = jsonDecode(resposta.body);

      //A api não localizou o CEP. Pode ser um CEP inválido ou não consta na base de dados do viacep
      if (cep.containsKey('erro') && cep['erro'] == 'true') {
        //lança uma exceção com o erro
        // throw Exception("CEP não encontrado!!!");
        throw CepNaoEncontradoException();
      } else {
        //converte o Json para um objeto Endereço
        return Endereco.deJson(cep);
      }
    } else {
      //Se o Status Code for diferente de 200, retorna uma exceção informando o código do erro.
      // throw Exception("Erro na busca do endereço: ${resposta.statusCode}");
      throw ApiInvalidaException("Erro na busca do endereço: ${resposta.statusCode}");
    }
  }
}