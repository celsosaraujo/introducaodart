class CepNaoInformadoException implements Exception{

  // final String mensagem;
  // CepInvalidException(this.mensagem);

  @override
  String toString() {    
    // return mensagem;
    return "CEP não informado. Preencha o campo 'Digite o CEP.'";
  }
}