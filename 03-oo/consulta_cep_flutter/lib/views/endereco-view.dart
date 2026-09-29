import 'dart:async';

import 'package:consulta_cep_flutter/exceptions/api-invalida-exception.dart';
import 'package:consulta_cep_flutter/exceptions/cep-invalido-exception.dart';
import 'package:consulta_cep_flutter/exceptions/cep-nao-encontrado-exception.dart';
import 'package:consulta_cep_flutter/models/endereco.dart';
import 'package:flutter/rendering.dart';

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

  String? mensagemErro;

  bool carregando = false;

  Future<void> consultarCEP() async {
    try {
      setState(() {
        carregando = true;
        mensagemErro = null;
        this.endereco = null;
      });
      String cep = enderecoController.validaCEP(cepController.text);

      final endereco = await enderecoController.buscarEndereco(cep);

      setState(() {
        this.endereco = endereco;
      });
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

                    if (endereco != null) ...[
                      const SizedBox(height: 24),

                      Text('Logradouro: ${endereco!.logradouro}'),

                      Text('Bairro: ${endereco!.bairro}'),

                      Text('Cidade: ${endereco!.localidade}'),

                      Text('UF: ${endereco!.uf}'),
                    ],

                    if (mensagemErro != null) ...[
                      const SizedBox(height: 16),

                      Text(
                        mensagemErro!,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ],

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
