import 'enum.dart';
import 'forma.dart';

class Triangulo extends Forma{

  double base, altura;
  
  Triangulo(this.base, this.altura):super(tpForma.Triangulo);

  @override
  double calculaArea() {
     return this.base * this.altura  /2 ;
  }

}