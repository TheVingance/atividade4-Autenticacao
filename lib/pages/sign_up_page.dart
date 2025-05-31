import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../login/widgets/custom_header.dart';
import '../login/widgets/login_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool _isLoading = false;

  Future<void> _signUp() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    final response = await Supabase.instance.client.auth.signUp(
      email: emailCtrl.text,
      password: passCtrl.text,
    );

    setState(() => _isLoading = false);

    if (response.user != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Registro bem-sucedido! Confirme seu e-mail.')),
      );
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao registrar usuário')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registrar')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const CustomHeader(text: "Crie sua conta"),
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
                      onPressed: _signUp,
                      child: const Text("Registrar"),
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
