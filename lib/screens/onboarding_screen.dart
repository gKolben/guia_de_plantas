import 'package:flutter/material.dart';
import 'package:guia_de_plantas/widgets/onboarding_page.dart'; // Importa nosso "molde"
import 'package:guia_de_plantas/theme/app_colors.dart'; // Importa as cores do aplicativo

class OnboardingScreen extends StatefulWidget { // StatefulWidget para gerenciar estado
  const OnboardingScreen({super.key}); // Construtor padrão

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState(); // Cria o estado associado
}

class _OnboardingScreenState extends State<OnboardingScreen> { // Estado da tela de onboarding
  final PageController _pageController = PageController(); // Controlador para o PageView, exigido pelo projeto

  // Lista com os dados de cada página do onboarding
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
              padding: const EdgeInsets.all(24.0), // Espaçamento ao redor do botão
              child: Container( // Contêiner para estilizar o botão
                width: double.infinity, // Largura máxima
                decoration: BoxDecoration( // Decoração do contêiner
                  gradient: const LinearGradient(
                    // Usando um verde um pouco mais escuro para começar o gradiente
                    colors: [Color(0xFF388E3C), AppColors.primaryGreen], // Gradiente do verde escuro para o verde principal
                    begin: Alignment.centerLeft, // Início do gradiente
                    end: Alignment.centerRight, // Fim do gradiente
                  ),
                  borderRadius: BorderRadius.circular(12), // Bordas arredondadas
                ),
                child: ElevatedButton( // Botão elevado
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home'); // Navega para a tela principal e remove a de onboarding da pilha
                  },
                  style: ElevatedButton.styleFrom( // Estilo do botão
                    backgroundColor: Colors.transparent, // Deixa o botão transparente
                    shadowColor: Colors.transparent, // Sem sombra
                    minimumSize: const Size(double.infinity, 50), // Largura máxima e altura fixa
                    padding: const EdgeInsets.symmetric(vertical: 16), // Espaçamento interno vertical
                  ),
                  child: const Text( // Texto do botão
                    'Começar',
                    style: TextStyle( // Estilo do texto
                      color: AppColors.textLight,
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // Negrito
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}