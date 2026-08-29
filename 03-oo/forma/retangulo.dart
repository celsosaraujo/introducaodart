import 'enum.dart';
import 'forma.dart';

class Retangulo extends Forma{

  double lado, altura;

  Retangulo(this.lado,this.altura):super(tpForma.Retangulo);

  @override
  double calculaArea() {    
    return this.lado * this.altura;
  }

}