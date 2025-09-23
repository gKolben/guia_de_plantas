// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:guia_de_plantas/theme/app_colors.dart';
import 'package:guia_de_plantas/widgets/onboarding_page.dart';
import 'package:guia_de_plantas/widgets/dots_indicator.dart'; // Importa nosso novo widget
import 'package:shared_preferences/shared_preferences.dart'; // Importa o SharedPreferences

class OnboardingScreen extends StatefulWidget { // 
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0; // Variável para guardar a página atual [cite: 821, 836]

  final List<Map<String, String>> _pages = [
    {
      "image": "assets/icon.png",
      "title": "Bem-vindo ao Guia de Plantas!",
      "description": "Seu companheiro digital para cuidar de suas plantas com amor e sabedoria."
    },
    {
      "image": "assets/icon.png",
      "title": "Dicas e Cuidados na Palma da Mão",
      "description": "Aprenda sobre luz, água e substrato ideais para cada tipo de planta."
    }
  ];
  
  // Função para salvar que o onboarding foi concluído
  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance(); // Pega a instância do SharedPreferences [cite: 204]
    await prefs.setBool('onboarding_completed', true); // Salva o valor 'true' [cite: 204, 271]
    
    if (mounted) { // Checa se o widget ainda está na tela [cite: 205]
      Navigator.pushReplacementNamed(context, '/home'); // Navega para a home [cite: 206]
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                // onPageChanged é chamado toda vez que o usuário arrasta para uma nova página
                onPageChanged: (page) {
                  setState(() {
                    _currentPage = page; // Atualiza a página atual [cite: 821, 913]
                  });
                },
                itemBuilder: (context, index) {
                  final pageData = _pages[index];
                  return OnboardingPage(
                    imagePath: pageData["image"]!,
                    title: pageData["title"]!,
                    description: pageData["description"]!,
                  );
                },
              ),
            ),
            // Indicador de progresso (pontinhos)
            DotsIndicator(
              totalDots: _pages.length,
              currentIndex: _currentPage,
            ),
            const SizedBox(height: 24), // Espaçamento
            
            // Botão "Começar"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primaryGreenDark, AppColors.primaryGreen],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  onPressed: _finishOnboarding, // Chama a função para salvar e navegar
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    minimumSize: const Size(double.infinity, 50),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text('Começar', style: TextStyle(color: AppColors.textLight, fontSize: 18, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
             const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}