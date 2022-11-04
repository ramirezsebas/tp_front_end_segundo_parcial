import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reserva_turnos_screen.dart';
import 'package:tp_front_end_segundo_parcial/services/tipo_producto_service.dart';

import '../models/ficha_clinica_model.dart';
import '../services/auth_service.dart';
import '../services/ficha_clinica_service.dart';
import '../services/persona_service.dart';
import 'create_ficha_clinica_screen.dart';
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
  Future<bool?> _showMyDialog() async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deseas Cerrar Sesion?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
            TextButton(
              child: const Text('Si'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
          ],
        );
      },
    );
  }

  Future<List<FichaClinicaModel>> getFichasClinicas() async {
    FichaClinicaService fichaClinicaService = FichaClinicaService();

    final fichas = await fichaClinicaService.getFichasClinicas();

    return fichas;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sin Piernas'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              _showMyDialog().then((value) async {
                if (value != null && value) {
                  AuthService authService = AuthService();
                  await authService.logout();

                  if (!mounted) {
                    return;
                  }

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
        onPressed: () async {
          /// Si currentPage es 0, entonces estamos en la pantalla de Ficha Clinica
          /// Si currentPage es 1, entonces estamos en la pantalla de Reserva Turno
          /// Si currentPage es 2, entonces estamos en la pantalla de Pacientes
          ///
          if (currentPage == 0) {
            final PersonaService personaService = PersonaService();
            final TipoProductoService tipoProductoService =
                TipoProductoService();

            final personas = await personaService.getPersonas();
            final tiposProductos = await tipoProductoService.getTipoProductos();
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => CreateFichaClinicaScreen(
                    personas: personas, tiposProductos: tiposProductos),
              ),
            );
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
