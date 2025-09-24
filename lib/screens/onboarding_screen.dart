// lib/screens/onboarding_screen.dart
import 'package:flutter/material.dart';
import 'package:guia_de_plantas/theme/app_colors.dart';
import 'package:guia_de_plantas/widgets/onboarding_page.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  bool _marketingConsent = false;

  // 4 páginas estratégicas do onboarding
  final List<Map<String, dynamic>> _pages = [
    {
      "image": "assets/icon.png",
      "title": "Bem-vindo ao Guia de Plantas!",
      "description": "Seu companheiro digital para cuidar de suas plantas com amor e sabedoria.",
      "type": "welcome"
    },
    {
      "image": "assets/icon.png",
      "title": "Como Funciona",
      "description": "Aprenda sobre luz, água e substrato ideais para cada tipo de planta. Receba lembretes personalizados e dicas especializadas.",
      "type": "how_it_works"
    },
    {
      "image": "assets/icon.png",
      "title": "Consentimento de Marketing",
      "description": "Gostaria de receber dicas exclusivas e novidades sobre cuidados com plantas?",
      "type": "consent"
    },
    {
      "image": "assets/icon.png",
      "title": "Vamos Começar!",
      "description": "Tudo pronto! Agora você pode explorar todas as funcionalidades do seu guia de plantas.",
      "type": "go_to_access"
    }
  ];

  @override
  Widget build(BuildContext context) {
    final isLastPage = _currentPage == _pages.length - 1;
    final isFirstPage = _currentPage == 0;
    final isConsentPage = _pages[_currentPage]["type"] == "consent";

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final pageData = _pages[index];
                  return OnboardingPage(
                    imagePath: pageData["image"]!,
                    title: pageData["title"]!,
                    description: pageData["description"]!,
                    type: pageData["type"]!,
                    onConsentChanged: isConsentPage ? _onConsentChanged : null,
                    marketingConsent: _marketingConsent,
                  );
                },
              ),
            ),
            
            // DotsIndicator - oculto na última página
            Visibility(
              visible: !isLastPage,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: DotsIndicator(
                  dotsCount: _pages.length,
                  position: _currentPage,
                  decorator: DotsDecorator(
                    color: Theme.of(context).colorScheme.onSurface.withOpacity(0.3),
                    activeColor: Theme.of(context).colorScheme.primary,
                    size: const Size.square(8.0),
                    activeSize: const Size(24.0, 8.0),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
              ),
            ),

            // Controles de navegação
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Botão Voltar - oculto na primeira e última página
                  Visibility(
                    visible: !isFirstPage && !isLastPage,
                    child: TextButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Voltar'),
                    ),
                  ),

                  // Botão Pular - visível enquanto não for a última página, vai para Consent
                  Visibility(
                    visible: !isLastPage && !isConsentPage,
                    child: TextButton(
                      onPressed: () {
                        _pageController.animateToPage(
                          2, // Vai para a página de Consent
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      child: const Text('Pular'),
                    ),
                  ),

                  // Botão Avançar/Finalizar - oculto na última página
                  Visibility(
                    visible: !isLastPage,
                    child: ElevatedButton(
                      onPressed: isConsentPage && !_marketingConsent 
                          ? null 
                          : () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                      child: const Text('Avançar'),
                    ),
                  ),

                  // Botão Finalizar - apenas na última página
                  Visibility(
                    visible: isLastPage,
                    child: ElevatedButton(
                      onPressed: _finishOnboarding,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(120, 50),
                      ),
                      child: const Text('Ir para o Acesso'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onConsentChanged(bool value) {
    setState(() {
      _marketingConsent = value;
    });
  }

  Future<void> _finishOnboarding() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('onboarding_completed', true);
      
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    } catch (e) {
      // Em caso de erro, ainda navega para home
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/home');
      }
    }
  }
}