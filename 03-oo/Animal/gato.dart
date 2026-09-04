import 'alimento.dart';
import 'animal.dart';
import 'especie.dart';

class Gato extends Animal{

  int romrom;

  Gato(String nome, double peso, this.romrom , Alimento alimento ): 
    super(nome, peso, alimento, Especie.MAMIFERO);

  void fazerCarinho(){
    romrom += 10;
    print("$nome está ronronando $romrom vezes mais");
  }  

  @override
  void fazerSom() {
    print("$nome fez miau!!!");
  }

  @override
  String toString() {
    return "Gato | Nome: $nome; Peso: $peso; Ronrom: $romrom; Especie: ${especie.name}";
  }

}