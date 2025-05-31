import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../login/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> _signOut(BuildContext context) async {
    await Supabase.instance.client.auth.signOut();

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (_) => const LoginPage()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _signOut(context),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Bem-vindo, ${user?.email ?? 'Usuário'}!",
          style: const TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
