import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../components/onboarding_step.dart';
import '../../components/my_button.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Contenido del Onboarding (PageView)
            Expanded(
              child: PageView(
                controller: _pageController,
                children: const [
                  OnboardingStep(
                    title: "Controla tus Gastos",
                    description: "Administra tus gastos de forma eficiente y organizada.",
                    asset: "assets/lottie/Animation - 1748534427619.json",
                  ),
                  OnboardingStep(
                    title: "Crea Grupos Compartidos",
                    description: "Trabaja en equipo para equilibrar los gastos.",
                    asset: "assets/lottie/Animation - 1748534731829.json",
                  ),
                  OnboardingStep(
                    title: "Alcanza tus Metas",
                    description: "Define tus objetivos financieros y cúmplelos.",
                    asset: "assets/lottie/Animation - 1748534873942.json",
                  ),
                ],
              ),
            ),
            
            // Controles inferiores
            Padding(
              padding: EdgeInsets.only(
                bottom: screenHeight * 0.05,
                left: 24,
                right: 24,
                top: 20,
              ),
              child: Column(
                children: [
                  // Indicador de páginas
                  SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: ExpandingDotsEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: theme.primaryColor,
                      dotColor: theme.colorScheme.surfaceVariant,
                    ),
                  ),
                  
                  const SizedBox(height: 32),
                  
                  // Botón de acción
                  MyButton(
                    text: _currentPage == 2 ? "Empezar" : "Siguiente",
                    onTap: () {
                      if (_currentPage < 2) {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      } else {
                        Navigator.pushReplacementNamed(context, '/login');
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}