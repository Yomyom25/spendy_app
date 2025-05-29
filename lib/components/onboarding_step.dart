import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class OnboardingStep extends StatelessWidget {
  final String title;
  final String description;
  final String asset;

  const OnboardingStep({
    Key? key,
    required this.title,
    required this.description,
    required this.asset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start, // Cambiado de center a start
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5, // Altura fija para la animación
            child: Lottie.asset(asset, fit: BoxFit.contain),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              description,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(), // Añade espacio flexible entre el texto y el botón
        ],
      ),
    );
  }
}