// Implements: deve ser utilizada para criar uma herança de uma classe abstract inteface
class LocalizacaoNaoEncontradaException implements Exception{

  @override
  String toString() {
    return "Não foi possível obter a localização!!!";
  }

}