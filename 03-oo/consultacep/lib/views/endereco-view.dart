import 'dart:async';
import 'dart:io';

import 'package:consultacep/controllers/endereco-controller.dart';
import 'package:consultacep/exceptions/api-invalida-exception.dart';
import 'package:consultacep/exceptions/cep-invalido-exception.dart';
import 'package:consultacep/exceptions/cep-nao-encontrado-exception.dart';
import 'package:consultacep/models/endereco.dart';

class EnderecoView {
  final enderecoController;

  EnderecoView() : enderecoController = EnderecoController() {}

  void iniciar() async {

    print("Informe o CEP (Formato 00000-000): ");
    String? cep = stdin.readLineSync();

    // cep = cep!.replaceAll(RegExp(r'[^0-9]'),'');
    try {
      Endereco endereco = await enderecoController.buscarEndereco(
        enderecoController.validaCEP(cep),
      );
      print("Logradouro: ${endereco.logradouro}");
      print("Bairro: ${endereco.bairro}");
      print("Municipio: ${endereco.localidade}");
      print("UF: ${endereco.uf}-${endereco.estado}");
    } on CepNaoEncontradoException catch(e){
      print(e);
    } on CepInvalidException catch(e){
      print('Erro na estrutura do CEP informado:');
      print(e);
    } on ApiInvalidaException catch(e){
      print("Erro na API");
      print(e);
    } catch (e) {
      print(e);
    }

  }

}
