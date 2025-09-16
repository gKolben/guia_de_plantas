import 'dart:async'; // Precisamos disso para o Timer
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  // Esta função é chamada uma única vez quando a tela é criada
  @override
  void initState() {
    super.initState();
    // Inicia um temporizador de 3 segundos
    Timer(const Duration(seconds: 3), () {
      // Após 3 segundos, navega para a tela de onboarding
      // Usamos 'pushReplacementNamed' para que o usuário não possa voltar para a splash screen [cite: 126, 128]
      Navigator.pushReplacementNamed(context, '/onboarding');
    });
  }

  // Esta função constrói a interface da tela
  @override
  Widget build(BuildContext context) {
    return Scaffold( // Estrutura base da página [cite: 43, 143]
      body: Center( // Centraliza todo o conteúdo
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Alinha os itens no centro verticalmente
          children: [
            // Mostra a imagem do ícone que colocamos na pasta assets
            Image.asset(
              'assets/icon.png',
              width: 100, // Define uma largura para a imagem
              height: 100, // Define uma altura para a imagem
            ),
            const SizedBox(height: 24), // Cria um espaço vertical entre a imagem e o indicador
            // Indicador de progresso circular [cite: 123]
            const CircularProgressIndicator(
              strokeWidth: 2, // Deixa a linha do círculo mais fina
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green), // Muda a cor para verde
            ),
          ],
        ),
      ),
    );
  }
}