import 'package:flutter/material.dart';

class FichaClinicaScreen extends StatelessWidget {
  const FichaClinicaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ficha Clinica'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/');
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
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
