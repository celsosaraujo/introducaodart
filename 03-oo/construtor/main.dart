import 'padrao.dart' as padrao;
import 'com_parametro.dart' as com_parametro;
import 'inicializacao_formal.dart' as inic_formal;
import 'obrigatorio_nomeado.dart' as ob_nomeado;
import 'opcional_nomeado.dart' as op_nomeado;
void main(List<String> args) {

  print('Criando uma instancia de uma classe com construtor padrão');
  final  carroGTR = padrao.Carro();
  carroGTR.fabricante = 'Nissan';
  carroGTR.modelo = "GTR";
  carroGTR.anoFabricacao = 2012;
  carroGTR.anoModelo = 2011;
  carroGTR.temABS = true;
  carroGTR.imprimeDados();

  print('\nCriando uma instancia de uma classe com construtor com parâmetros');
  final  carroGTR1 = com_parametro.Carro( 'Nissan',"GTR",2012,2011,true);
  carroGTR1.imprimeDados();

  print('\nCriando uma instancia de uma classe com construtor com inicialização formal');
  final  carroGTR2 = inic_formal.Carro( 'Nissan',"GTR",2012,2011,true);
  carroGTR2.imprimeDados();

  print('\nCriando uma instancia de uma classe com construtor com parametros nomeados e obrigatórios');
  final carroGTR3 = ob_nomeado.Carro(temABS: true,
                                     modelo: 'GTR',
                                     fabricante:'Nissan',
                                     anoModelo: 2011,
                                     anoFabricacao: 2012
                                    );
  carroGTR3.imprimeDados();                                  

  print('\nCriando uma instancia de uma classe com construtor com parametros nomeados e opcionais');
  final carroGTR4 = op_nomeado.Carro(fabricante: 'Nissan',
                                     modelo: 'GTR',
                                     anoModelo: 2012);
  carroGTR4.imprimeDados();  

  print('\nChamando método toString()');
  print(carroGTR4);

}