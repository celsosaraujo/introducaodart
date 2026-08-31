// class Carro extends Object{
class Carro{
  String fabricante;
  String modelo;
  int anoFabricacao;
  int anoModelo;
  bool temABS;

   //Construtor com parâmetros
   Carro( 
          { 
            required this.fabricante,
            required this.modelo,
            this.anoFabricacao = 2012, 
            this.anoModelo = 2011,  
            this.temABS = true
          } 
        );

  void imprimeDados(){
    print(retornaDados());
  }

  String retornaDados(){
    return '''
              Fabricante: ${this.fabricante} \n
              modelo: ${this.modelo} \n
              Ano de Fabricação: ${this.anoFabricacao} \n
              Ano do Modelo: ${this.anoModelo} \n
              Tem Abs: ${(this.temABS!)?"SIM":"NÃO"}
           ''';
  }

  @override
  String toString() {    
    return retornaDados();
  }

}