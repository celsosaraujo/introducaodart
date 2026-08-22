void main(List<String> args) {

   print("Inclua os dados do aluno no formato NOME|IDADE|CURSO|UF");
   final alunos = [];
   alunos.add("JOAO|25|DESENVOLVIMENTO DE SISTEMAS|SP");
   alunos.add("MARIA|19|REFLEXOLOGIA|RJ");
   alunos.add("JOSE|50|ADMINISTRACAO|ES");

   print(alunos[0]);
   final aluno = alunos[0].toString().split("|");
   print("\nNome: ${aluno[0]} Idade: ${aluno[1]} Curso: ${aluno[2]} UF: ${aluno[3]}");

   //1º) Imprimir a lista Utilizando foreach
   for (var aluno in alunos) {
      final dados = aluno.split("|");
      print("\nNome: ${dados[0]} Idade: ${dados[1]} Curso: ${dados[2]} UF: ${dados[3]}");     
   }

   alunos.forEach((aluno){
    var dados = aluno.split("|");
    print("\nNome: ${aluno[0]} Idade: ${aluno[1]} Curso: ${aluno[2]} UF: ${aluno[3]}");    
   });

   //2º) Adiciona o estudante abaixo no final da lista
   // "SAMIRA|63|PODOLOGIA|SP";
   alunos.add("SAMIRA|63|PODOLOGIA|SP");
   print(alunos);

   //3º) Adicionar o estudante abaixo na 2ª Posição da Lista
   //"JOAQUIN|36|TST|RS" 
   alunos.insert(1, "JOAQUIN|36|TST|RS");
   print(alunos);

  //4º) Remover a "MARIA|19|REFLEXOLOGIA|RJ" da lista  
  alunos.remove("MARIA|19|REFLEXOLOGIA|RJ");
   print(alunos);

  //5º) Remover a 3º item da lista  
  alunos.removeAt(2);
  print(alunos);

}