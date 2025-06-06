import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../main.dart';
import '../pages/sign_up_page.dart';
import '../theme/theme_controller.dart';
import 'widgets/custom_header.dart';
import 'widgets/login_text_form_field.dart';
import '../theme/theme_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _signIn() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final response = await Supabase.instance.client.auth.signInWithPassword(
      email: emailCtrl.text,
      password: passCtrl.text,
    );

    setState(() => _isLoading = false);

    if (response.user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Login bem-sucedido!')),
      );
          Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const HomePage()),
      (Route<dynamic> route) => false,
    ); // navegação home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Falha no login. Verifique suas credenciais.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () => themeController.toggleTheme(),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CustomHeader(text: "Bem-vindo de volta!"),
              LoginTextFormField(
                controller: emailCtrl,
                label: "E-mail",
                validator: _validateEmail,
              ),
              const SizedBox(height: 16),
              LoginTextFormField(
                controller: passCtrl,
                label: "Senha",
                obscure: true,
                validator: _validatePassword,
              ),
              const SizedBox(height: 24),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _signIn,
                      child: const Text("Entrar"),
                    ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const SignUpPage()),
                  );
                },
                child: const Text("Registrar-se"),
              ),
              TextButton(
                onPressed: () {
                  // TODO: implementar reset de senha
                },
                child: const Text("Esqueci minha senha"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) return 'E-mail é obrigatório';
    final regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!regex.hasMatch(value)) return 'Informe um e-mail válido';
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Senha é obrigatória';
    if (value.length < 6) return 'Senha deve ter pelo menos 6 caracteres';
    return null;
  }
}
