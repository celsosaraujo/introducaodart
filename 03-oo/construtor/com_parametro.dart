class Carro{
  String? fabricante;
  String? modelo;
  int? anoFabricacao;
  int? anoModelo;
  bool? temABS;

   //Construtor com parâmetros
   Carro( String fabricante,
          String modelo,
          int anoFabricacao, 
          int anoModelo,  
          bool temABS 
        ):super(){
    this.fabricante = fabricante;
    this.modelo = modelo;
    this.anoFabricacao = anoFabricacao;
    this.anoModelo = anoModelo;
    this.temABS = temABS;       
  }

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

}