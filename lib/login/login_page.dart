import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';
import 'widgets/custom_header.dart';
import 'widgets/login_text_form_field.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailCtrl = TextEditingController();
    final passCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => ThemeController.instance.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const CustomHeader(text: "Bem-vindo de volta!"),
            LoginTextFormField(controller: emailCtrl, label: "E-mail"),
            const SizedBox(height: 16),
            LoginTextFormField(
              controller: passCtrl,
              label: "Senha",
              obscure: true,
            ),
            const SizedBox(height: 24),
            ElevatedButton(onPressed: () {}, child: const Text("Entrar")),
            TextButton(onPressed: () {}, child: const Text("Registrar-se")),
            TextButton(
              onPressed: () {},
              child: const Text("Esqueci minha senha"),
            ),
          ],
        ),
      ),
    );
  }
}
