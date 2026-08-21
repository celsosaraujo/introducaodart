import 'dart:io';

void main(List<String> args) {
  print("Informe um número: ");
  final numero = stdin.readLineSync();  
  if( numero != null && int.tryParse(numero) != null){

    final numeroConvertido = int.tryParse(numero);

    // if( numeroConvertido! % 2 == 0 ){
    //   print("Número par");      
    // }else{
    //   print("Número ímpar");
    // }

    //operador ternário
    print("Número ${numeroConvertido! % 2 == 0?"par":"ímpar"}");

  }else{
    print("Número inteiro inválido");
  }
}