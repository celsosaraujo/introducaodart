void main(List<String> args) {
  final estudante = <String,String>{
    'nome': "Fulano de Tal",
    "Curso": "Desenvolvimento de Sistemas"
  };

  print(estudante);

  final escola = <String,Object>{
    'nome': 'Senac Marília',
    'cursos':[
      {
        'nome':'Técnico em Desenvolvimento de Sistemas',
        'Descrição': 'Implementação de sistemas para web e mobile'
      },
      {
        'nome':'Técnico em Segurança do Trabalho',
        'Descrição': 'Gerenciamento das NRs- Normas Regulamentadoras'
      }
    ]
  };
  print(escola);
  print("Escola: ${escola['nome']}");
  print("Cursos");
  for (var curso in escola['cursos'] as List) {
    print("- ${curso['nome']} - ${curso['Descrição']}");
  }
}