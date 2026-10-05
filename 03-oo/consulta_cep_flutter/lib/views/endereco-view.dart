import 'dart:async';

import '../exceptions/api-invalida-exception.dart';
import '../exceptions/cep-invalido-exception.dart';
import '../exceptions/cep-nao-encontrado-exception.dart';
import '../models/endereco.dart';
import '../models/localizacao.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

import '../controllers/endereco-controller.dart';
import 'package:flutter/material.dart';

class EnderecoView extends StatefulWidget {
  const EnderecoView({super.key});

  @override
  State<StatefulWidget> createState() => _EnderecoViewState();
}

class _EnderecoViewState extends State<EnderecoView> {
  final TextEditingController cepController = TextEditingController();

  final EnderecoController enderecoController = EnderecoController();

  Endereco? endereco;

  Localizacao? localizacao;

  String? mensagemErro;

  bool carregando = false;

  bool localizacaoIndisponivel = false;

  Future<void> consultarCEP() async {
    try {

      setState(() {
        carregando = true;
        mensagemErro = null;
        this.endereco = null;
        this.localizacao = null;
        localizacaoIndisponivel = false;
      });

      String cep = enderecoController.validaCEP(cepController.text);

      final endereco = await enderecoController.buscarEndereco(cep);

      setState(() {
        this.endereco = endereco;
      });

      try{

        final localizacao = await enderecoController.buscarLocalizacao(cep);

        setState(() {
          this.localizacao = localizacao;          
        });

      }catch (e){
        setState(() {
          localizacaoIndisponivel = true;
        });
      }

    } on CepInvalidException catch (e) {
      setState(() {
        mensagemErro = e.toString();
      });
    } on CepNaoEncontradoException catch (e) {
      setState(() {
        mensagemErro = e.toString();
      });
    } on ApiInvalidaException catch (e) {
      setState(() {
        mensagemErro = e.toString();
      });
    } catch (e) {
      setState(() {
        mensagemErro = e.toString();
      });
    } finally {
      setState(() {
        carregando = false;
      });
    }
  }

  void limparTela() {
    cepController.clear();

    setState(() {
      endereco = null;
      mensagemErro = null;
    });
  }

  _construirCabecalho() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 36),

      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0865C9), Color(0XFF1685F8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),

        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),

      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Consulta CEP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                Text(
                  'Encontre endereços de forma rápida e fácil',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 72,
            height: 72,

            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.16),
              borderRadius: BorderRadius.circular(22),
            ),

            child: const Icon(
              Icons.location_on_rounded,
              color: Colors.white,
              size: 44,
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirCampoCEP() {
    return TextField(
      controller: cepController,

      keyboardType: TextInputType.number,

      textInputAction: TextInputAction.search,

      onSubmitted: (_) {
        consultarCEP();
      },

      onChanged: (valor){
        setState(() {});
      },

      decoration: const InputDecoration(
        labelText: 'Digite o CEP',
        hintText: '00000-000',
        prefixIcon: const Icon(Icons.search_rounded),
      ),
    );
  }

  Widget _construirBotaoConsultar(){
    return SizedBox(
      height: 56,
      child: ElevatedButton.icon(
        onPressed: carregando ? null: consultarCEP, 
        icon: const Icon( 
          Icons.search_rounded 
        ),     

        label: const Text(
          'Consultar',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),
        ),

        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF0969E8),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          )
        )
      ),
    );
  }

  Widget _construirBotaoLimpar(){
    return SizedBox(
      height: 52,
      child: OutlinedButton.icon(
        onPressed: limparTela, 
        icon: const Icon(
          Icons.cleaning_services_rounded,
        ),
        label: const Text('Limpar'),
        style: OutlinedButton.styleFrom(
          foregroundColor:  const Color(0xFF0969E8),
          side: const BorderSide(
            color: Color(0xff0969E8),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),        
      ),
    );
  }

  Widget _construirSucesso(){

    return Container(

      margin: const EdgeInsets.only(bottom: 16),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: Color(0Xfff8f8ef),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Row(
        children: [
          Container(

            padding: const EdgeInsets.all(9),

            decoration: const BoxDecoration(
              color: Color(0xdd16a765),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_rounded,
              color: Colors.white,
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Endereço encontrado!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF137A48),
                  ),
                ),

                Text('CEP ${endereco!.cep} localizado com sucesso'),
              ],
            )
          ),
        ],
      ),
    );
  }

  Widget _linhaEndereco(
    IconData icone,
    String titulo,
    String valor, {bool mostrarDivisor = true}
  ){
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 46,
              height: 46,
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5FA),
                borderRadius: BorderRadius.circular(14)
              ),

              child: Icon(
                icone,
                color: const Color(0xff60758F),
              ),
            ),            

            const SizedBox(width: 14,),

            Expanded(
              child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start, 
                 children: [
                  Text(
                    titulo,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Color(0xFF60758F),
                    ),
                  ),

                  const SizedBox(height: 3,),

                  Text(
                    valor.isEmpty? 'Não informado':valor,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF14213D),
                    ),
                  ),

                 ],
              )
            )
          ],

        ),

        if(mostrarDivisor) ...[

          const SizedBox(height: 12,),

          const Divider(
            height: 1,
            color: Color(0xFFEDF1F7),
          ),

          const SizedBox(height: 12,),
        ]
      ],
    );
  }

  Widget _construirAvisoLocalizacao() {

    return Container(

      margin:
          const EdgeInsets.only(
            top: 16,
          ),

      padding:
          const EdgeInsets.all(16),

      decoration: BoxDecoration(

        color:
            const Color(0xFFFFF8E1),

        borderRadius:
            BorderRadius.circular(16),

        border: Border.all(
          color:
              const Color(0xFFFFE082),
        ),
      ),

      child: const Row(

        children: [

          Icon(
            Icons.location_off_rounded,
            color:
                Color(0xFFF57F17),
          ),

          SizedBox(width: 12),

          Expanded(

            child: Column(

              crossAxisAlignment:
                  CrossAxisAlignment.start,

              children: [

                Text(
                  'Localização indisponível',

                  style: TextStyle(
                    fontWeight:
                        FontWeight.bold,

                    color:
                        Color(0xFF795548),
                  ),
                ),

                SizedBox(height: 4),

                Text(
                  'O endereço foi encontrado, '
                  'mas não foi possível obter '
                  'a localização no mapa.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _construirLocalizacao() {

    return Card(

      margin:
          const EdgeInsets.only(
            top: 16,
          ),

      child: Padding(

        padding:
            const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.start,

          children: [

            const Row(

              children: [

                Icon(
                  Icons.location_on_rounded,
                  color:
                      Color(0xFF0969E8),
                ),

                SizedBox(width: 8),

                Text(
                  'Localização',

                  style: TextStyle(
                    fontSize: 18,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Text(
              'Latitude: '
              '${localizacao!.latitude}',
            ),

            Text(
              'Longitude: '
              '${localizacao!.longitude}',
            ),
          ],
        ),
      ),
    );
  }

  Widget _construirEndereco(){
    return Column(
      children: [

        _construirSucesso(),

        Card(
          elevation: 0,

          color: Colors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(24),
            side: const BorderSide(
              color: Color(0xFFEDF147),
            )
          ),

          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.home_rounded,
                      color: Color(0xff0969e8),
                    ),

                    const SizedBox(width: 10,),

                    Text(
                      'Endereço',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 20,),

                _linhaEndereco(
                  Icons.signpost_rounded,
                  'Logradouro' ,
                  endereco!.logradouro,
                ),

                _linhaEndereco(
                  Icons.location_city_rounded,                   
                  'Bairro', 
                  endereco!.bairro,
                ),

                _linhaEndereco(
                  Icons.apartment_rounded,                   
                  'Cidade', 
                  endereco!.localidade,
                ),

                _linhaEndereco(
                  Icons.map_rounded,                   
                  'Estado (UF)', 
                  '${endereco!.uf} - ${endereco!.estado}',
                ),                    
              

              ],

            ),
          ),

        ),       

      ],
    );
  }

  Widget _construirErro(){

    return Container(

      margin: const EdgeInsets.only(top: 8),

      padding: const EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: const Color(0xffffebee),

        borderRadius: BorderRadius.circular(16),

        border: Border.all(
          color: const Color(0XFFFCDD2),
        )
      ),

      child: Row(
        children: [
          const Icon(
            Icons.error_outline_rounded,
            color: Colors.red,
          ),

          // const SizedBox(width: 12,),

          Expanded(
            child: Text(
              mensagemErro!,
              style: const TextStyle(
                color: Color(0xffb71c1c),
              ),
            )
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: const Text('Consulta CEP')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              // cabeçalho
              _construirCabecalho(),

              Padding(
                padding: const EdgeInsets.all(20),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [

                    // Campo CEP
                    _construirCampoCEP(),

                    const SizedBox(height: 16),

                    _construirBotaoConsultar(),

                    const SizedBox(height: 16),

                    _construirBotaoLimpar(),

                    const SizedBox(height: 24),

                    if (endereco != null)
                      _construirEndereco(),

                    if (mensagemErro != null)
                      _construirErro(), 

                    if(localizacaoIndisponivel)
                      _construirAvisoLocalizacao(),  
                      
                    if(localizacao != null)  
                      _construirLocalizacao(),

                    if (carregando) ...[
                      const SizedBox(height: 24),

                      const Center(child: CircularProgressIndicator()),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
