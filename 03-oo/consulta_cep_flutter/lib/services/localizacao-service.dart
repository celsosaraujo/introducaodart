import 'dart:convert';

import '../exceptions/localizacao-nao-encontrada-exception.dart';
import '../models/localizacao.dart';
import 'package:http/http.dart' as http;

class LocalizacaoService {

  Future<Localizacao> consultar( String CEP ) async {

    final url = Uri.parse('https://cep.awesomeapi.com.br/jso/$CEP');

    final resposta = await http.get(url);

    if( resposta.statusCode == 200 ){

      Map<String, dynamic> dados = jsonDecode(resposta.body);

      return Localizacao.deJson(dados);
    }

    throw LocalizacaoNaoEncontradaException();

  }
}