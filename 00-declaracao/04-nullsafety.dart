void main(List<String> args) {
  String nomeNonNullSafety;

  // Não permite utilizar a variável sem inicilizá-la
  // print(nomeNonNullSafety);

  nomeNonNullSafety = 'Valor';
  print(nomeNonNullSafety);

  String? nomeNullSafety;  
  print(nomeNullSafety);
  if(nomeNullSafety != null )
    print("Variável nomeNullSafety está vazia: ${nomeNullSafety.isEmpty}");

  // ?? é um operador ternário. Ser a variável estiver nula, 
  //executará a empressão do lado direito do operador ??
  String? nomeNullSafety2;
  print("Variável nomeNullSafety2 está vazia: ${nomeNullSafety2?.isEmpty ?? "Não atribuído"}");

  print("Variável nomeNullSafety2 está vazia: ${nomeNullSafety2?.isEmpty ?? true}");


  //! ignora as validações do null safety e você 
  //fica responsável em garantir que a variável não está nula
  String? nomeNullSafety1;
  print("Variável nomeNullSafety está vazia: ${nomeNullSafety1!.isEmpty}");





}