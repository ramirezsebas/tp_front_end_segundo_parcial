import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/filter_reserva.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_screen.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/header_appbar.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/widgets/button_green.dart';
import 'gradient_back.dart';

class ReservaTurnoScreen extends StatelessWidget {
  const ReservaTurnoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var screenWidht = MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      child: Column(
          children: [
            Container(
              child: const ListTile(
                title: Text("Reservas",
                style: TextStyle(
                  fontSize: 20.0,
                  fontFamily: "Lato",
                  fontWeight: FontWeight.bold,
                ),),
                leading: Icon(Icons.calendar_month_outlined),
              ),
            ),
             FilterReservaWidget(),
             const Expanded(child:ReservaScreen() ),

          ],
        ),
    );
  }
}
