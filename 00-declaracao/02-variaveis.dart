import 'dart:ffi';

void main(List<String> args) {
  //sintaxe
  //<tipo> nome = atribuição;
  String nome = "Fulano de tal";

  //declarar e atribuir em linhas diferentes
  int idade;
  idade = 18;

  double cotacaoDolar = 5.19;

  //Concateção de String
  print("Nome: " + nome + " - Idade: " + idade.toString());

  //Interpolação de String
  print("Nome: ${nome} - Idade: ${idade.toString()}");

  //fortimente tipada
  // não permite a atribuição de um valor em uma variável, cujo tipo não comporata o valor
  // idade = "doze"; 
  // idade = 1.5;

  // permite atribuir quando não há perda de precisão. Um inteiro cabe dentro de um double
  cotacaoDolar = 5;

  // Não permite incluir um double dentro de um inteiro, pois poderia haver perda de precisão
  // idade = cotacaoDolar;

  //Nome da variável não pode utilizar caracteres especiais, espaçoes ou palavras reservadas
  // https://dart.dev/language/

  //Palavra reservada var para declarar uma variável com tipo inferido
  var idadeInferido = 1;

  //aceita qualquer coisa
  dynamic idadeDynamic;
  idadeDynamic = 11;
  idadeDynamic = "Onze";

  //Object é uma classe base de todos os objetos
  //Isso significa que todos os tipos DART, incluindo os tipos primários, são do tipo Object

  Object idadeObject;
  idadeObject = 15;
  idadeObject = "Quinze";
  idadeObject = new Int();

  Object idade_object_snack_case;
  Object idadeObjectCamelCase;

  print(idadeDynamic);
}