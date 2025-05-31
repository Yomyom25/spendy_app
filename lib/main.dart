import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:spendy_app/pages/onboarding/onboarding_page.dart';
import 'package:spendy_app/pages/auth/login_page.dart';
import 'package:spendy_app/pages/auth/register_page.dart';
import 'package:spendy_app/pages/dashboard/dashboard.dart';
import 'package:spendy_app/pages/porfile/profile_page.dart';
import 'firebase_options.dart'; // Asegúrate de que este archivo exista

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Gastos',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingPage(),
        '/login': (context) => const LoginPage(),
        '/register': (context) => const RegisterPage(),
        '/dashboard': (context) => const Dashboard(),
        '/profile': (context) => const ProfilePage(), // Ruta añadida
      },
    );
  }
}
