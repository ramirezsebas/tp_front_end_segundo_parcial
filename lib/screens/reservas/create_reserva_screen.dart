import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/filter_agenda.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/screens/agenda_screen.dart';

import '../../models/persona_model.dart';
import '../../models/reserva_model.dart';
import '../../services/persona_service.dart';
import '../../services/reserva_service.dart';

class CreateReservaScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _CreateReservaScreen();
}

class _CreateReservaScreen extends State<CreateReservaScreen> {
  late Future<List<ReservaModel>> currentReserva;
  PersonaService personaService = PersonaService();
  ReservaService reservaService = ReservaService();
  DateTime? FechaActual;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void initState() {
    super.initState();
    currentReserva = reservaService.getAgenda(2, "20190903");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Reserva"),
      ),
      body: FutureBuilder<List<ReservaModel>>(
        future: currentReserva,
        initialData: const [],
        builder: (BuildContext context,
            AsyncSnapshot<List<ReservaModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final reservas = snapshot.data!;
              return AgendaScreen(title: "ss", currentReserva: reservas, fecha: "20190903");
            } else {
              return const Center(
                child: Text('No hay datos'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

}

// class CreateReservaScreen extends StatelessWidget {
//    CreateReservaScreen({Key? key}) : super(key: key);
//
//    List<PersonaModel>? Clientes;
//    Future<List<ReservaModel>> getAgenda(int id, String fecha) async {
//      ReservaService reservaService = ReservaService();
//
//      final reservas = await reservaService.getAgenda(id, fecha);
//
//
//      return reservas;
//    }
//    Future<List<PersonaModel>> getPersonas() async {
//      PersonaService personaService = PersonaService();
//
//      final personas = await personaService.getPersonas();
//
//      return personas;
//    }
//
//   // @override
//   // Widget build(BuildContext context) {
//   //   return Scaffold(
//   //     appBar: AppBar(
//   //       title: const Text("Crear Reserva"),
//   //     ),
//   //     body: FutureBuilder<List<ReservaModel>>(
//   //       future: getAgenda(2, "20190903"),//Parametrizar
//   //       initialData: const [],
//   //       builder: (BuildContext context, AsyncSnapshot<List<ReservaModel>> snapshot) {
//   //         if (snapshot.connectionState == ConnectionState.done) {
//   //           if (snapshot.hasData) {
//   //             final reservas = snapshot.data!;
//   //             return AgendaWidget(title: "ss", currentReserva: reservas, fecha: "20190903",Cliente: ,);
//   //           } else {
//   //             return const Center(
//   //               child: Text('No hay datos'),
//   //             );
//   //           }
//   //         } else {
//   //           return const Center(
//   //             child: CircularProgressIndicator(),
//   //           );
//   //         }
//   //       },
//   //     ),
//   //   );
//   // }
// }
