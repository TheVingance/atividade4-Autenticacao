import 'package:flutter/material.dart';
import '../theme/theme_controller.dart';
import 'widgets/custom_header.dart';
import 'widgets/login_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>(); // Key para o formulário

  // Função para validar o e-mail
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'E-mail é obrigatório';
    }
    String pattern =
        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Informe um e-mail válido';
    }
    return null;
  }

  // Função para validar a senha
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 6) {
      return 'Senha deve ter pelo menos 6 caracteres';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
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
        child: Form(
          key: _formKey, // Usando a chave para validar o formulário
          child: Column(
            children: [
              const CustomHeader(text: "Bem-vindo de volta!"),
              LoginTextFormField(
                controller: emailCtrl,
                label: "E-mail",
                validator: validateEmail, // Validação de e-mail
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: passCtrl,
                label: "Senha",
                obscure: true,
                validator: validatePassword, // Validação de senha
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState?.validate() ?? false) {
                    // Se o formulário for válido, então podemos processar o login
                    // Aqui você pode adicionar a lógica para autenticação
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Login bem-sucedido')),
                    );
                  }
                },
                child: const Text("Entrar"),
              ),
              TextButton(onPressed: () {}, child: const Text("Registrar-se")),
              TextButton(
                onPressed: () {},
                child: const Text("Esqueci minha senha"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
