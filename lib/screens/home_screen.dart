/*
 * HomeScreen - Tela Principal do Guia de Plantas
 * 
 * Esta tela representa a interface principal do aplicativo onde o usuário
 * verá suas plantas cadastradas. Atualmente apresenta:
 * - AppBar personalizada com título "Minhas Plantas"
 * - Fundo em verde claro para manter a identidade visual
 * - Mensagem de boas-vindas centralizada
 * 
 * Futuramente poderá incluir:
 * - Lista de plantas cadastradas
 * - Botão para adicionar novas plantas
 * - Funcionalidades de busca e filtro
 */

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Esta AppBar vai pegar o estilo automaticamente do nosso appBarTheme
      appBar: AppBar(
        title: const Text('Guia de Plantas'),
      ),
      // Substituição do Center por um ListView para preparar para a lista de plantas
      body: ListView(
        // Padding para dar um respiro nas bordas
        padding: const EdgeInsets.all(16.0),
        children: const [
          // Um texto de exemplo para ver o layout funcionando
          Text(
            'Minhas Plantas',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          // Aqui é onde a nossa lista de plantas vai entrar no futuro
        ],
      ),
    );
  }
}