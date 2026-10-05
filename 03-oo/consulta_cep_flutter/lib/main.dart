import 'package:flutter/material.dart';
import 'views/endereco-view.dart';

void main() {
  runApp(const ConsultaCEPApp());
}

class ConsultaCEPApp extends StatelessWidget {
  const ConsultaCEPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(   
      debugShowCheckedModeBanner: false,
      title: 'Consulta CEP',

      theme: ThemeData(
        useMaterial3: true,

        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0969E8),
        ),

        scaffoldBackgroundColor: const Color(0xFFF6F8FC),

        fontFamily: 'Roboto',

        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,

          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide.none,
          ),

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFDCE5F2),
            ),
          ),

          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFF0969E8),
              width: 2,
            ),
          ),
        ),
      ),

      home: const EnderecoView(),
    );
  }
}