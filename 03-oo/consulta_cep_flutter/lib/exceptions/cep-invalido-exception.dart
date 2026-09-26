class CepInvalidException implements Exception{

  // final String mensagem;
  // CepInvalidException(this.mensagem);

  @override
  String toString() {    
    // return mensagem;
    return "CEP inválido, deve possuir 8 números. Preste atenção na máscara de informação.";
  }
}