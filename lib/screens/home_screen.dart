import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reserva_turnos_screen.dart';

import '../core/utils/custom_dialog.dart';
import 'pacientes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _pages = [
    const FichaClinicaScreen(),
    const ReservaTurnoScreen(),
    const PacientesScreen(),
  ];
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sin Piernas'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              showMyDialog(context, title: 'Deseas Cerrar Sesion?')
                  .then((value) {
                if (value != null && value) {
                  Navigator.of(context).pushReplacementNamed('/login');
                }
              });
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: _pages,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          /// Si currentPage es 0, entonces estamos en la pantalla de Ficha Clinica
          /// Si currentPage es 1, entonces estamos en la pantalla de Reserva Turno
          /// Si currentPage es 2, entonces estamos en la pantalla de Pacientes
          ///
          if (currentPage == 0) {
            Navigator.of(context).pushNamed('/createFichaClinica');
          }
          // TODO: Implementar la navegacion a la pantalla de Crear Paciente
          // TODO: Implementar la navegacion a la pantalla de Crear Reserva
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.local_hospital_outlined),
            label: 'Fichas Clinicas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_outlined),
            label: 'Reserva de Turnos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Pacientes',
          ),
        ],
      ),
    );
  }
}
