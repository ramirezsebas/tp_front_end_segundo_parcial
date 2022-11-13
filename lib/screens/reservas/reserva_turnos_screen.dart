import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/filter_reserva.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_screen.dart';

class ReservaTurnoScreen extends StatelessWidget {
  const ReservaTurnoScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      child: Column(
          children: [
            const ListTile(
              title: Text("Reservas",
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: "NEXA",
                fontWeight: FontWeight.bold,
              ),),
              leading: Icon(Icons.calendar_month_outlined, color:Color(0xFF4268D3)),
            ),
            FilterReservaWidget(),
            Expanded(child:ReservaScreen( json: '{"idEmpleado":{"idPersona" : 2}, "idCliente":{"idPersona" : 21}, "fechaDesdeCadena":"20190903", "fechaHastaCadena":"20190903"}',) ),

          ],
        ),
    );
  }
}
