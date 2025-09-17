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

class HomeScreen extends StatelessWidget { // Converte para StatelessWidget
  const HomeScreen({super.key}); // Construtor padrão

  @override
  Widget build(BuildContext context) { // Constrói a interface da tela inicial
    return Scaffold( // Estrutura básica da tela
      // A barra de título do aplicativo
      appBar: AppBar( // Barra de aplicativo no topo
        title: const Text('Minhas Plantas'), // Título da barra
        backgroundColor: Colors.green[100], // Uma cor suave para a barra
        elevation: 1, // Uma leve sombra
      ),
      body: const Center( // Corpo da tela centralizado
        child: Text( // Texto de boas-vindas
          'Bem-vindo ao seu guia de plantas!',
          style: TextStyle(fontSize: 18), // Tamanho da fonte
        ),
      ),
    );
  }
}