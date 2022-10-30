import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/filter_agenda.dart';
import 'package:tp_front_end_segundo_parcial/services/persona_service.dart';

class CreateReservaScreen extends StatelessWidget {
   CreateReservaScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Reserva"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children:[
            Text("Agenda"),
            FilterAgendaWidget(),
          ],
        ),
      ),
    );
  }
}
