import 'package:flutter/material.dart';
import 'package:spendy_app/pages/onboarding/onboarding_page.dart';
import 'package:spendy_app/pages/auth/login_page.dart';
import 'package:spendy_app/pages/auth/register_page.dart';
import 'package:spendy_app/pages/dashboard/dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      debugShowCheckedModeBanner: false, // Esta línea quita el banner de debug
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const Dashboard(),
      },
    );
  }
}
