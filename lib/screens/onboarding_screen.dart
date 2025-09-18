import 'package:flutter/material.dart';
import 'package:guia_de_plantas/widgets/onboarding_page.dart'; // Importa nosso "molde"

class OnboardingScreen extends StatefulWidget { // StatefulWidget para gerenciar estado
  const OnboardingScreen({super.key}); // Construtor padrão

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState(); // Cria o estado associado
}

class _OnboardingScreenState extends State<OnboardingScreen> { // Estado da tela de onboarding
  final PageController _pageController = PageController(); // Controlador para o PageView, exigido pelo projeto

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
  Widget build(BuildContext context) { // Constrói a interface da tela de onboarding
    return Scaffold(
      // Requisito: Usar SafeArea para evitar que o conteúdo fique atrás de notchs e barras [cite: 43]
      body: SafeArea(
        child: Column( // Usando Column para empilhar o PageView e o botão
          children: [ // Nosso layout vertical
            Expanded( // Expande para preencher o espaço disponível
              // Requisito: Usar PageView para o carrossel com rolagem por gesto 
              child: PageView.builder( 
                controller: _pageController, // Controlador para gerenciar páginas
                itemCount: _pages.length, // Número de páginas
                itemBuilder: (context, index) { // Constrói cada página
                  final pageData = _pages[index]; // Dados da página atual
                  // Usando nosso widget reutilizável
                  return OnboardingPage( // Nosso "molde"
                    imagePath: pageData["image"]!,// Caminho da imagem
                    title: pageData["title"]!, // Título da página
                    description: pageData["description"]!, // Descrição da página
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
                  Navigator.pushReplacementNamed(context, '/home'); // Vai para a tela principal (home)
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50), // Botão largo
                ),
                child: const Text('Começar'), // Texto do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}