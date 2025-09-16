import 'package:flutter/material.dart';

// Este é o "molde" para cada página do nosso carrossel
class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( // Adiciona espaçamento em todas as bordas
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centraliza o conteúdo verticalmente
        children: [
          // Requisito: Imagem com bordas arredondadas 
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              height: 250, // Altura da imagem
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 40), // Espaçamento
          // Título da página
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16), // Espaçamento
          // Descrição da página
          Text(
            description,
            style: const TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}