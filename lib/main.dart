import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/light_theme.dart';
import 'theme/dark_theme.dart';
import 'theme/theme_controller.dart';
import 'splash/animated_splash.dart';
import 'onboarding/onboarding_page.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(MyApp());
}

class ThemeController {
  ValueNotifier<bool> isDark = ValueNotifier(false);

  ThemeData get currentTheme => isDark.value ? darkTheme : lightTheme;

  void toggleTheme() {
    isDark.value = !isDark.value;
  }
}

final themeController = ThemeController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: themeController.isDark,
      builder: (context, isDark, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha Aplicação"),
        actions: [
          Row(
            children: [
              const Text("Modo escuro"),
              const SizedBox(width: 8),
              IconButton(
                icon: Icon(
                  themeController.isDark.value
                      ? Icons.dark_mode
                      : Icons.light_mode,
                ),
                onPressed: () {
                  themeController.toggleTheme();
                },
              ),
            ],
          ),
        ],
      ),
      body:
          const OnboardingPage(), // ou LoginPage() se quiser iniciar direto nela
    );
  }
}
