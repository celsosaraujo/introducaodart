import 'alimento.dart';
import 'especie.dart';

// Generalização

abstract class Animal {
  String nome;
  double peso;
  Alimento alimento;
  Especie especie;

  Animal(this.nome, this.peso, this.alimento, this.especie);

  void fazerSom();

  void comer(){
    print("$nome comeu! - ${alimento.tipo}");
  }

}