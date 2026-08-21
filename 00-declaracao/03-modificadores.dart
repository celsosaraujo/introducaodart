void main(List<String> args) {

  //declaração por Inferência
  var nomeCurso = "Fundamentos Dart";
  print("Curso: ${nomeCurso}");

  //Modificador FINAL
  //Uma variável declarada como final pode ser atribuída apenas uma vez e 
  //seu valor não pode ser alterado
  // final nomeCursoFinal = "Fundamentos Dart";
  // Posso declarar em um ponto do sistema e atribuir o valor em outro
  final nomeCursoFinal;
  nomeCursoFinal = "Fundamentos Dart";
  print(nomeCursoFinal);

  // não pode ser reatribuído
  // nomeCursoFinal = "Fundamentos Flutter";

  //Modificador CONST
  //Uma variável declarada como const pode ser atribuída apenas uma vez e 
  //seu valor não pode ser alterado
  const nomeCursoConst = "Fundamentos Dart";

  // Const deve ser declarada e atribuída
  // const nomeCursoConst;
  // nomeCursoConst = "Fundamentos Dart";
  // print(nomeCursoConst);


}