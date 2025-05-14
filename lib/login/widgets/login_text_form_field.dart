import 'package:flutter/material.dart';

class LoginTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool obscure;
  final String? Function(String?)? validator; // Parâmetro para validação

  const LoginTextFormField({
    Key? key,
    required this.controller,
    required this.label,
    this.obscure = false,
    this.validator, // Aceitando o parâmetro de validação
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure, // Para esconder o texto, como no campo de senha
      decoration: InputDecoration(
        labelText: label, // Texto do label
      ),
      validator: validator, // Validando o campo com o parâmetro de validação
    );
  }
}
