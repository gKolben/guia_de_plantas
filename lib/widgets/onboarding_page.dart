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