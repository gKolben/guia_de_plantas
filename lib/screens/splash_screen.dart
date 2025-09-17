/*
 * SplashScreen - Tela de Carregamento Inicial
 * 
 * Esta é a primeira tela que aparece quando o aplicativo é aberto.
 * Características principais:
 * - Exibe o logo do aplicativo (icon.png)
 * - Mostra um indicador de carregamento circular verde
 * - Permanece visível por 3 segundos
 * - Navega automaticamente para a tela de onboarding
 * 
 * Funcionalidades:
 * - Usa StatefulWidget para gerenciar o estado do temporizador
 * - Implementa initState() para configurar a navegação temporizada
 * - Usa Timer para controlar o tempo de exibição
 * - Utiliza pushReplacementNamed para evitar retorno à splash screen
 */

import 'dart:async'; // Precisamos disso para o Timer
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget { // StatefulWidget para gerenciar estado
  const SplashScreen({super.key}); // Construtor padrão

  @override
  State<SplashScreen> createState() => _SplashScreenState(); // Cria o estado associado
}

class _SplashScreenState extends State<SplashScreen> { // Estado da SplashScreen

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
              'assets/icon.png', // Caminho da imagem
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