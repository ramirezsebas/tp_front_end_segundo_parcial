import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/home_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centro de Rehabilitacion Fisioterapeutica',
      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => const HomeScreen(),
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
