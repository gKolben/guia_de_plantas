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

// lib/screens/splash_screen.dart
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Importa o SharedPreferences

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _checkOnboardingStatus(); // Chama nossa nova função de verificação
  }
  
  Future<void> _checkOnboardingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;

    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      if (onboardingCompleted) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        Navigator.pushReplacementNamed(context, '/onboarding');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/icon.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}