import 'dart:math';

import 'enum.dart';
import 'forma.dart';

class Circulo extends Forma{
  double raio;
  Circulo(this.raio):super(tpForma.Circulo);

  @override
  double calculaArea() {
     return pow(raio,2)*pi;
  }


}