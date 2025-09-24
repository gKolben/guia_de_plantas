/*
 * OnboardingPage - Widget de Página para Onboarding
 * 
 * Este widget representa uma página individual do carrossel de onboarding.
 * Cada página contém:
 * - Uma imagem com bordas arredondadas
 * - Um título em destaque
 * - Uma descrição explicativa
 * - Funcionalidade de consentimento para marketing (quando aplicável)
 * 
 * Parâmetros requeridos:
 * - imagePath: caminho da imagem a ser exibida
 * - title: título da página
 * - description: texto descritivo da página
 * - type: tipo da página (welcome, how_it_works, consent, go_to_access)
 * 
 * Parâmetros opcionais:
 * - onConsentChanged: callback para mudanças no consentimento
 * - marketingConsent: estado atual do consentimento
 * 
 * Características visuais:
 * - Padding uniforme de 24px
 * - Imagem com altura fixa de 250px
 * - Título em fonte maior e negrito
 * - Descrição em fonte padrão
 * - Espaçamentos verticais entre elementos
 * - Material 3 theming
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Widget para cada página do onboarding
class OnboardingPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final String type;
  final Function(bool)? onConsentChanged;
  final bool marketingConsent;

  const OnboardingPage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.type,
    this.onConsentChanged,
    this.marketingConsent = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Imagem com bordas arredondadas
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              imagePath,
              height: 250,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 40),
          
          // Título da página
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          
          // Descrição da página
          Text(
            description,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          
          // Widget específico para página de consentimento
          if (type == "consent") ...[
            const SizedBox(height: 32),
            _buildConsentWidget(context),
          ],
        ],
      ),
    );
  }

  Widget _buildConsentWidget(BuildContext context) {
    return Column(
      children: [
        // Opção Sim
        Card(
          elevation: 2,
          child: RadioListTile<bool>(
            title: const Text('Sim, quero receber dicas e novidades'),
            subtitle: const Text('Receba conteúdo exclusivo sobre cuidados com plantas'),
            value: true,
            groupValue: marketingConsent,
            onChanged: (value) {
              if (value != null) {
                onConsentChanged?.call(value);
                _saveMarketingConsent(value);
              }
            },
          ),
        ),
        const SizedBox(height: 16),
        
        // Opção Não
        Card(
          elevation: 2,
          child: RadioListTile<bool>(
            title: const Text('Não, obrigado'),
            subtitle: const Text('Apenas funcionalidades básicas do app'),
            value: false,
            groupValue: marketingConsent,
            onChanged: (value) {
              if (value != null) {
                onConsentChanged?.call(value);
                _saveMarketingConsent(value);
              }
            },
          ),
        ),
      ],
    );
  }

  Future<void> _saveMarketingConsent(bool consent) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('marketing_consent', consent);
    } catch (e) {
      // Em caso de erro, não faz nada - o estado local já foi atualizado
    }
  }
}