/* 
 * Este é o arquivo principal do aplicativo Guia de Plantas.
 * Ele configura o ponto de entrada do aplicativo Flutter, define o tema,
 * e estabelece as rotas de navegação entre as telas (splash, onboarding e home).
 * O aplicativo usa Material Design 3 com um esquema de cores baseado em verde.
 */

import 'package:flutter/material.dart'; // Importa o pacote Flutter para widgets de material design
import 'package:guia_de_plantas/screens/home_screen.dart'; // Importa a tela principal (home)
import 'package:guia_de_plantas/screens/onboarding_screen.dart'; // Importa a tela de onboarding
import 'package:guia_de_plantas/screens/splash_screen.dart'; // Importa a tela de splash
import 'package:guia_de_plantas/theme/app_colors.dart'; // Importa as cores do aplicativo
void main() { // Ponto de entrada do aplicativo
  runApp(const MeuApp()); // Usa o widget MeuApp como raiz do aplicativo
}

class MeuApp extends StatelessWidget { // Converte para StatelessWidget
  const MeuApp({super.key}); // Construtor padrão

  @override // Sobrescreve o método build
  Widget build(BuildContext context) { // Constrói a interface do aplicativo
    return MaterialApp( // Usa MaterialApp para configurar o tema e as rotas
      title: 'Guia de Plantas', // Título do aplicativo
      debugShowCheckedModeBanner: false, // Remove a faixa de debug

      theme: ThemeData( // Define o tema do aplicativo
        scaffoldBackgroundColor: AppColors.background, // Fundo branco puro para todas as telas
    
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColors.primaryGreen,
      primary: AppColors.primaryGreen,
    ),

    // Tema da AppBar com estilo iOS
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background, // Fundo branco
      foregroundColor: AppColors.textDark, // Texto e ícones escuros
      elevation: 0, // Sem sombra
      centerTitle: true, // Título centralizado
      titleTextStyle: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.textDark,
      ),
    ),

    // Animações de transição de página no estilo iOS
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),

    useMaterial3: true,
      ),
      initialRoute: '/splash', // Rota inicial é a tela de splash
      routes: { // Define as rotas do aplicativo
        '/splash': (context) => const SplashScreen(), // Rota para a tela de splash
        '/onboarding': (context) => const OnboardingScreen(), // Rota para a tela de onboarding
        '/home': (context) => const HomeScreen(), // Rota para a tela principal (home)
      },
    );
  }
}