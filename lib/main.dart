import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tp_front_end_segundo_parcial/screens/create_paciente_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/home_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/login_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/pacientes_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/splash_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/create_reserva_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_turnos_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Permite que todos estos tipos de dispositivos se puedan utilizar para
      // "arrastrar" la pantalla, permitiendo refrescar la pantalla con el mouse
      // arrastrando hacia abajo.
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {
          PointerDeviceKind.mouse,
          PointerDeviceKind.touch,
          PointerDeviceKind.stylus,
          PointerDeviceKind.unknown
        },
      ),
      title: 'Centro de Rehabilitacion Fisioterapeutica',
      routes: {
        '/': (context) => const HomeScreen(),
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/fichas_clinicas': (context) => const FichaClinicaScreen(),
        '/reserva_turnos': (context) => ReservaTurnoScreen(),
        '/pacientes': (context) => const PacientesScreen(),
        // '/createFichaClinica': (context) => const CreateFichaClinicaScreen()
        '/createReserva': (context) => CreateReservaScreen(),
        '/createPaciente': (context) => const CreatePacienteScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
    );
  }
}
