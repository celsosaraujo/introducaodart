void main(List<String> args) {
  //tipos genéricos
  List<int> listaNumeros = [1,2,3];
  List<String> listaTextos = ["Fulano","Beltrano","Sicrano"];

  //Tipos de lista por Inferência
  var listaNumerosInferencia = [1,2,3];
  var listaTextosInferencia = ["Fulano", "Beltrano","Sicrano"];

  //Lista vazia
  List<int> listaSemNumeros = []; 
  var listaSemNumerosInferencia = <int>[];
  var listaSemTextosInteferencia = <String>[];

  //NullSafety

  //tem que iniciar a Lista e os itens não podem ser nulos;
  List<String> nome;  

  // apresentar porque a lista deve ser inicializada
  // nome = null;

  // apresenta erro, pois a lista não está inicializada
  // print(nome.length);

  nome = [];
  print(nome.length);

  // apresenta um erro, pois a lista não permite itens nulos
  // nome = ["Fulano", null];

  //Não precisa inciar a Lista, porém os itens não podem ser nulos
  List<String>? nomeSemIniciar;
  nomeSemIniciar = null;
  if(nomeSemIniciar != null)
    print(nomeSemIniciar.length);

  //Precisa Iniciar a lista, porém os itens podem ser nulos
  List<String?> nomeItensNulos;
  
  // apresentar porque a lista deve ser inicializada
  // nomeItensNulos = null;

  nomeItensNulos = ["Fulano",null];

  //Não precisa inicializar e os itens podem ser nulos
  List<String?>? nomeSemIniciaItensNulos;
  nomeSemIniciaItensNulos = null;
  nomeSemIniciaItensNulos = ["Fulano", null];

  //declaração por inferência
  var nomeItensNulosInferencia = <String?>[null];  

  final numeros = [1,2,3,4];
  print(numeros);

  //método add: adiciona um item no final da lista
  numeros.add(5);
  print(numeros);

  final nomes = ["Fulano","Beltrano"];
  nomes.add("Sicrano");
  print("1º) ${nomes[0]}");
  print("2º) ${nomes[1]}");
  print("3º) ${nomes[2]}");

  //método insert: adiciona um novo item em um posição determinada
  nomes.insert(0,"Novo primeiro Nome");
  print(nomes);

  //método insertAll: adiciona uma lista em outra
  final nomesNovos = ["João","Maria"];
  nomes.addAll(nomesNovos);
  print(nomes);

  //método remove: remove um item da lista
  nomes.remove("João");
  print(nomes);
  
}