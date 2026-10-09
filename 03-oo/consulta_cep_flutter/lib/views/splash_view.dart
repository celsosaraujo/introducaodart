import 'package:flutter/material.dart';

import 'endereco-view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    iniciarAplicativo();
  }

  Future<void> iniciarAplicativo() async {

    // Tempo de apresentação da tela
    await Future.delayed(
      const Duration(seconds: 3),
    );

    if (!mounted) return;

    // Abre a tela principal do aplicativo
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const EnderecoView(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xFF0969E8),

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              Image.asset(
                'assets/splash/splash_logo.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),

              const SizedBox(height: 24),

              const Text(
                'Consulta CEP',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Encontre endereços com facilidade',
                style: TextStyle(
                  color: Color(0xFFDDEBFF),
                  fontSize: 15,
                ),
              ),

              const SizedBox(height: 48),

              const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3,
              ),

            ],
          ),
        ),
      ),
    );
  }
}