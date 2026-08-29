import 'circulo.dart';
import 'forma.dart';
import 'quadrado.dart';
import 'retangulo.dart';
import 'triangulo.dart';

void main(List<String> args) {

    //polimorfismo: 
    Forma objQuadrado = Quadrado(15.0);
    objQuadrado.imprimeForma();

    Forma objRetangulo = Retangulo(10.5, 26.3);
    objRetangulo.imprimeForma();

    Forma objTringulo = Triangulo(10.0, 30.0);
    objTringulo.imprimeForma();    

    Forma objCirculo = Circulo(50.5);
    objCirculo.imprimeForma();

    List<Forma> formas = [];
    formas.add( Quadrado(8.0) );
    formas.add( Retangulo(10.0, 5.0));
    formas.add( Triangulo(10.0, 5.0));
    formas.add( Circulo(10.0));

    print("\n ----> COLEÇÃO <----");
    formas.forEach((forma) => forma.imprimeForma());

    print("\n ----> for in <----");
    for (var forma in formas) {
       forma.imprimeForma(); 
    }

    print("\n ----> for <----");
    for (var i = 0; i < formas.length; i++) {
      formas[i].imprimeForma();
    }


}