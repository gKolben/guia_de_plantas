/*
 * OnboardingPage - Widget de Página para Onboarding
 * 
 * Este widget representa uma página individual do carrossel de onboarding.
 * Cada página contém:
 * - Uma imagem com bordas arredondadas
 * - Um título em destaque
 * - Uma descrição explicativa
 * 
 * Parâmetros requeridos:
 * - imagePath: caminho da imagem a ser exibida
 * - title: título da página
 * - description: texto descritivo da página
 * 
 * Características visuais:
 * - Padding uniforme de 24px
 * - Imagem com altura fixa de 250px
 * - Título em fonte maior (24px) e negrito
 * - Descrição em fonte padrão (16px)
 * - Espaçamentos verticais entre elementos
 */

import 'package:flutter/material.dart';

// Este é o "molde" para cada página do nosso carrossel
class OnboardingPage extends StatelessWidget { // StatelessWidget pois é estático
  // Dados que cada página precisa
  final String imagePath;
  final String title;
  final String description;

  const OnboardingPage({ // Construtor com parâmetros nomeados
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
        children: [ // Conteúdo da página
          // Requisito: Imagem com bordas arredondadas 
          ClipRRect( // Para arredondar as bordas da imagem
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              height: 250, // Altura da imagem
              fit: BoxFit.cover, // Cobre o espaço mantendo a proporção
            ),
          ),
          const SizedBox(height: 40), // Espaçamento
          // Título da página
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold, // Negrito para destaque
            ),
            textAlign: TextAlign.center, // Centraliza o texto
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