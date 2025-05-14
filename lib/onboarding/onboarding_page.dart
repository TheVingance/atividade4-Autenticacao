import 'package:flutter/material.dart';
import '/login/login_page.dart'; // Certifique-se que este caminho está correto

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final titles = ["Bem-vindo", "Organização", "Facilidade"];
    final descs = [
      "Este app ajuda você a manter tudo sob controle.",
      "Gerencie suas tarefas e compromissos em um só lugar.",
      "Navegação intuitiva para facilitar seu dia a dia.",
    ];
    final icons = [Icons.waving_hand, Icons.dashboard, Icons.bolt];

    return Scaffold(
      body: PageView.builder(
        itemCount: titles.length,
        itemBuilder: (context, index) =>
            _buildPage(context, titles[index], descs[index], icons[index], index == titles.length - 1),
      ),
    );
  }

  Widget _buildPage(
    BuildContext context,
    String title,
    String desc,
    IconData icon,
    bool isLastPage, // Adiciona parâmetro para saber se é a última tela
  ) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon, // ícone que será exibido na tela
            size: 64,
            color: Colors.deepPurple,
          ),
          Text(
            title,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 40),
          if (isLastPage) // Se for a última página, mostra o botão
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 12,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const LoginPage()),
                );
              },
              child: const Text(
                "Vamos começar",
                style: TextStyle(fontSize: 16),
              ),
            ),
          const SizedBox(height: 20),
          Text(
            'Arraste para o lado para navegar',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}
