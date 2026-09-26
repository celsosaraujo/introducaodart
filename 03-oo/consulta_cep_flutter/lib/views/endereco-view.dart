import 'dart:async';

import 'package:consulta_cep_flutter/models/endereco.dart';

import '../controllers/endereco-controller.dart';
import 'package:flutter/material.dart';

class EnderecoView extends StatefulWidget {

  const EnderecoView({super.key});  

  @override
  State<StatefulWidget> createState() => _EnderecoViewState();

}

class _EnderecoViewState extends State<EnderecoView>{

  final TextEditingController cepController = TextEditingController();

  final EnderecoController enderecoController = EnderecoController();

  Endereco? endereco;

  String? mensagemErro;

  bool carregando = false;

  Future<void> consultarCEP() async{

    try{

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

    }catch (e){

      setState(() {

        mensagemErro = e.toString();
        endereco = null;

      });

    }finally{
      setState(() {
        carregando = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text('Consulta CEP'),
      ),

      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: [
            TextField(
              controller: cepController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'CEP',
                hintText: '00000-000',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: consultarCEP, 
              child: const Text('Consultar')
            ),

            if( endereco != null ) ...[
              const SizedBox(height: 24,),

              Text(
                'Logradouro: ${endereco!.logradouro}'  
              ),  
              
              Text(
                'Bairro: ${endereco!.bairro}'  
              ),  

              Text(
                'Cidade: ${endereco!.localidade}'  
              ),  

              Text(
                'UF: ${endereco!.uf}'  
              ),  
            ],

            if(mensagemErro != null ) ...[
              const SizedBox(height: 16,),

              Text(
                mensagemErro!,
                style: const TextStyle(color: Colors.red),                
              )
            ],

            if(carregando) ...[

              const SizedBox(height: 24,),

              const Center(
                child: CircularProgressIndicator(),
              )
            ]
            

          ],
          ),
      
      ),
    );      

  }

}
