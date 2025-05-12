import 'package:flutter/material.dart';
import 'dart:math';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({super.key});

  @override
  State<LoadingIndicator> createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> rotationAnim;
  late final Animation<double> scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat();

    rotationAnim = Tween<double>(begin: 0, end: 2 * pi).animate(_controller);
    scaleAnim = Tween<double>(begin: 0.8, end: 1.2).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.0, 0.5, curve: Curves.easeInOut),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.rotate(
              angle: rotationAnim.value,
              child: Transform.scale(
                scale: scaleAnim.value,
                child: const Icon(
                  Icons.auto_awesome, // ícone personalizado escolhido
                  size: 64,
                  color: Colors.deepPurple, // cor personalizada
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
