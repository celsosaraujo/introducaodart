import 'dart:convert';

import 'package:consulta_cep/consulta_cep.dart' as consulta_cep;

// dart pub add http (importa o pacote do pub.dev)
// declara o http para utilização na classe/função
import 'package:http/http.dart' as http;
Future<void> main(List<String> arguments) async{
  // Future: resultado que ainda vai chegar
  // async: permite usa await dentro da função/método
  // await: espera o resultado

    final url = Uri.parse("https://viacep.com.br/ws/17509060/json");
    // final url = Uri.parse("https://viacep.com.br/ws/17509000/json");

    final resposta = await http.get(url);

    if(resposta.statusCode == 200 ){     
      print(resposta.body);    
      // Imprimir apenas os seguintes campos:
      // - Logradouro
      // - Bairro
      // - Cidade
      // - UF
      Map<String,dynamic> cep = jsonDecode(resposta.body);
      print("- Logradouro: ${cep['logradouro']}");
      print("- Bairro: ${cep['bairro']}");
      print("- Cidade: ${cep['localidade']}");
      print("- UF: ${cep['uf']}");

    }else{
      print("CEP inválido ou inexistente!");
    }
}
