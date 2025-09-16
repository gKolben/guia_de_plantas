import 'package:flutter/material.dart';
import 'package:guia_de_plantas/widgets/onboarding_page.dart'; // Importa nosso "molde"

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controlador para o PageView, exigido pelo projeto 
  final PageController _pageController = PageController();

  // Lista com os dados de cada página do onboarding
  // Para o nosso app de plantas!
  final List<Map<String, String>> _pages = [
    {
      "image": "assets/icon.png", // Usando o mesmo ícone por enquanto
      "title": "Bem-vindo ao Guia de Plantas!",
      "description": "Seu companheiro digital para cuidar de suas plantas com amor e sabedoria."
    },
    {
      "image": "assets/icon.png", // Você pode usar outra imagem aqui depois
      "title": "Dicas e Cuidados na Palma da Mão",
      "description": "Aprenda sobre luz, água e substrato ideais para cada tipo de planta."
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Requisito: Usar SafeArea para evitar que o conteúdo fique atrás de notchs e barras [cite: 43]
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              // Requisito: Usar PageView para o carrossel com rolagem por gesto 
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                itemBuilder: (context, index) {
                  final pageData = _pages[index];
                  // Usando nosso widget reutilizável
                  return OnboardingPage(
                    imagePath: pageData["image"]!,
                    title: pageData["title"]!,
                    description: pageData["description"]!,
                  );
                },
              ),
            ),
            // Botão para pular ou finalizar o onboarding
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                onPressed: () {
                  // Requisito: Navegação por substituição para o fluxo unidirecional [cite: 40]
                  Navigator.pushReplacementNamed(context, '/home');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Botão largo
                ),
                child: const Text('Começar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}