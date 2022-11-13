import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/create_ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/create_paciente_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/home_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/login_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/pacientes_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reserva_turnos_screen.dart';

void main() => runApp(const MyApp());

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
        '/login': (context) => const LoginScreen(),
        '/fichas_clinicas': (context) => const FichaClinicaScreen(),
        '/reserva_turnos': (context) => const ReservaTurnoScreen(),
        '/pacientes': (context) => const PacientesScreen(),
        '/createFichaClinica': (context) => const CreateFichaClinicaScreen(),
        '/createPaciente': (context) => const CreatePacienteScreen()
      },
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
    );
  }
}
