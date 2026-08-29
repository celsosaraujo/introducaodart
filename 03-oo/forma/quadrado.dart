import 'forma.dart';
import 'enum.dart';

//Herança/Generalização
//Classe Quadrado herda os membros (variáveis de instância e métodos) 
//de Forma
class Quadrado extends Forma{

  //
  double lado;

  //construtor da Classe Quadrado
  //chamando o construtor da classe pai
  Quadrado(this.lado) :super(tpForma.Quadrado);

  //sobrescrever o método abstrato da classe pai
  @override
  double calculaArea() {
    return lado * lado;
  }
  

}