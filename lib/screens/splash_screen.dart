/*
 * SplashScreen - Tela de Carregamento Inicial
 * 
 * Esta é a primeira tela que aparece quando o aplicativo é aberto.
 * Características principais:
 * - Exibe o logo do aplicativo (icon.png)
 * - Mostra um indicador de carregamento circular verde
 * - Navegação inteligente baseada no estado do onboarding
 * - Navega automaticamente para a tela apropriada
 * 
 * Funcionalidades:
 * - Usa Future.microtask para navegação assíncrona segura
 * - Verifica onboarding_completed via SharedPreferences
 * - Implementa tratamento de erros com fallback
 * - Utiliza pushReplacementNamed para evitar retorno à splash screen
 */

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToNextScreen();
  }

  // Navegação assíncrona segura com Future.microtask
  void _navigateToNextScreen() {
    Future.microtask(() async {
      try {
        final prefs = await SharedPreferences.getInstance();
        final onboardingCompleted = prefs.getBool('onboarding_completed') ?? false;
        
        // Delay opcional de até 3s para melhor UX
        await Future.delayed(const Duration(seconds: 2));
        
        if (mounted) {
          if (onboardingCompleted) {
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            Navigator.pushReplacementNamed(context, '/onboarding');
          }
        }
      } catch (e) {
        // Em caso de erro, vai para onboarding por padrão
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/onboarding');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo do aplicativo
            Image.asset(
              'assets/icon.png',
              width: 100,
              height: 100,
            ),
            const SizedBox(height: 24),
            // Indicador de progresso circular
            const CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
            const SizedBox(height: 16),
            // Texto de carregamento
            Text(
              'Carregando...',
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}