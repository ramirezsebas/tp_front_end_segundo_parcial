import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/create_ficha_clinica_screen.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tp_front_end_segundo_parcial/screens/ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/home_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/login_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/pacientes_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reserva_turnos_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/splash_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Centro de Rehabilitacion Fisioterapeutica',
      routes: {
        '/': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/fichas_clinicas': (context) => const FichaClinicaScreen(),
        '/reserva_turnos': (context) => const ReservaTurnoScreen(),
        '/pacientes': (context) => const PacientesScreen(),
        '/createFichaClinica': (context) => const CreateFichaClinicaScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
    );
  }
}
