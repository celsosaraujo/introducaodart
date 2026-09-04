import 'alimento.dart';
import 'brinquedo.dart';
import 'cachorro.dart';
import 'gato.dart';

void main(List<String> args) {
  // var racaoGato = Alimento("ração de atum");
  var gato = Gato("Garfield", 25.0, 0, Alimento("ração de atum"));
  print(gato);

  var cachorro = Cachorro("Snup", 14.4, 0, Alimento("Royal Canym"));
  print(cachorro);

  var bola = Brinquedo("Bola");
  cachorro.incluiBrinquedo(bola);
  cachorro.incluiBrinquedo(Brinquedo("Osso"));

  // cachorro.brincar(bola);
  cachorro.brincar(Brinquedo("Bola"));

}