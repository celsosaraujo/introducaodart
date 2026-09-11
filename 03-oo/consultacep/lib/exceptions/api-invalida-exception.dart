class ApiInvalidaException implements Exception{
  final String mensagem;

  ApiInvalidaException(this.mensagem);

  @override
  String toString() {    
    return mensagem;
  }

}