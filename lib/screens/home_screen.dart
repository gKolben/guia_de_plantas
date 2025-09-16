import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // A barra de título do aplicativo
      appBar: AppBar(
        title: const Text('Minhas Plantas'),
        backgroundColor: Colors.green[100], // Uma cor suave para a barra
        elevation: 1, // Uma leve sombra
      ),
      body: const Center(
        child: Text(
          'Bem-vindo ao seu guia de plantas!',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}