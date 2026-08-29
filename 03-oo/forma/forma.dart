import 'enum.dart';

abstract class Forma {

  // declarando uma variável de instância
  tpForma tipoForma;

  //declarando o construção
  // Forma( tpForma varForma ){
  //   this.tipoForma = varForma;
  // }
  Forma( this.tipoForma );

  //declarando um método abstrato
  //método abstrato não tem corpo
  double calculaArea();

  //declarando um método de instância (concreto)
  void imprimeForma(){
    //Quando a variável de instancia é nullable (?)
    //deve ser verificado se ela está nula 
    // if(tipoForma != null){
    //   print("${tipoForma!.name} com área de ${calculaArea()}");
    // }
    print("${tipoForma.name} - ${tipoForma.index} com área de ${calculaArea()}");
  }




}