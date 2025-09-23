// lib/widgets/dots_indicator.dart
import 'package:flutter/material.dart';

class DotsIndicator extends StatelessWidget {
  final int totalDots;
  final int currentIndex;

  const DotsIndicator({
    super.key,
    required this.totalDots,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    // Pega as cores do tema principal do app
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      // Gera a lista de pontinhos dinamicamente
      children: List.generate(totalDots, (index) {
        final isSelected = index == currentIndex;
        
        // Usa um container animado para a transição suave de cor
        return AnimatedContainer(
          duration: const Duration(milliseconds: 300), // Duração da animação [cite: 393, 453]
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          height: 8.0, // Tamanho dos pontinhos
          width: isSelected ? 24.0 : 8.0, // O pontinho selecionado fica mais largo
          decoration: BoxDecoration(
            // Usa a cor primária para o selecionado e uma cor neutra para os outros [cite: 398, 413]
            color: isSelected ? colorScheme.primary : colorScheme.onSurface.withOpacity(0.3),
            borderRadius: BorderRadius.circular(12), // Deixa em formato de pílula
          ),
        );
      }),
    );
  }
}