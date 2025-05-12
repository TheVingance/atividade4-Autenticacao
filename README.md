Estrutura das pastas

lib/
├── main.dart
├── theme/
│   ├── light_theme.dart
│   └── dark_theme.dart
├── pages/
│   ├── splash_screen.dart
│   ├── onboarding_page.dart
│   └── login_page.dart
├── widgets/
│   ├── login_text_form_field.dart
│   └── custom_header.dart

# Flutter App – Splash, Onboarding, Login e Tema Dinâmico

Este projeto Flutter simula a entrada de um aplicativo real com foco em animações, temas e reutilização de widgets.

## 🔥 Funcionalidades

- ✅ **Splash Screen nativa e animada**
- ✅ **Onboarding com PageView (3 telas)**
- ✅ **Tela de login funcional com validação**
- ✅ **Suporte a tema claro e escuro em tempo real**
- ✅ **Widgets customizados reutilizáveis**

---

## 📱 Telas

| Tela | Descrição |
|------|-----------|
| **Splash Screen** | Splash nativa com `flutter_native_splash` e animação com `ScaleTransition`. |
| **Onboarding** | 3 páginas com imagem, texto e botão de avanço para a tela de login. |
| **Login** | Campos validados para e-mail/senha, e botões de ação. |
| **Tema** | Alternância de tema claro/escuro via `ValueNotifier` e `ThemeController`. |

---

## 🎨 Temas

Implementados em:

- `theme/light_theme.dart`
- `theme/dark_theme.dart`

Controlados dinamicamente por um `ThemeController` com `ValueNotifier`.

---

## 🧱 Widgets Customizados

- `LoginTextFormField`: TextFormField estilizado com foco e validação.
- `CustomHeader`: Widget decorativo reutilizável no topo das telas.

---

## 🚀 Como executar

1. **Clone o repositório:**

```bash
git clone https://github.com/TheVingance/atividade4-autenticacao
cd atividade4-autenticacao


 Dependências principais
flutter_native_splash

provider (se utilizado para controle de estado)

font_awesome_flutter (opcional para ícones personalizados)
