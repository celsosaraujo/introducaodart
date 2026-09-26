import 'package:consulta_cep_flutter/views/endereco-view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ConsultaCEPApp());
}

class ConsultaCEPApp extends StatelessWidget{

  const ConsultaCEPApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,

        home: EnderecoView(),        

      );
    
  }
  

}