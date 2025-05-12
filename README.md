📱 Custom Loading Indicator com Flutter

Este projeto demonstra como criar:
- Um botão na tela inicial.
- Navegar para uma tela de carregamento customizada.
- Um indicador de carregamento animado usando *AnimationController, **Transform.rotate* e *Transform.scale*.

🚀 Tecnologias usadas
- Flutter
- Dart

📂 Estrutura
- HomePage: Tela inicial com um botão "Ir para Carregamento".
- CustomLoadingIndicator: Tela de carregamento com animação de rotação e escala.

🎯 Funcionalidades
- *Botão de navegação*: Clicando no botão, o usuário é direcionado para a tela de carregamento.
- *Animação contínua*: Ícone Icons.sync rotaciona 360° enquanto aumenta e diminui de tamanho.

📜 Código principal

*1. Tela Inicial (HomePage)*
dart
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CustomLoadingIndicator()),
    );
  },
  child: const Text('Ir para Carregamento'),
)


*2. Tela de Carregamento (CustomLoadingIndicator)*
dart
AnimatedBuilder(
  animation: _controller,
  builder: (context, child) {
    return Transform.rotate(
      angle: rotationAnim.value,
      child: Transform.scale(
        scale: scaleAnim.value,
        child: const Icon(Icons.sync, size: 48),
      ),
    );
  },
)


⚙️ Como rodar
1. Clone o projeto:
   bash
   git clone https://github.com/Zimmer-7/carregamento_customizado
   
2. Entre na pasta:
   bash
   cd carregamento_customizado
   
3. Rode o app:
   bash
   flutter run
   

📝 Observações
- O AnimationController é configurado para 1.5 segundos e se repete indefinidamente.
- Sempre chamar dispose() no AnimationController para evitar vazamentos de memória.

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
