import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/models/reserva_dto.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/filter_reserva.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_screen.dart';
import 'package:tp_front_end_segundo_parcial/services/reserva_service.dart';

import '../../models/reserva_model.dart';

class ReservaTurnoScreen extends StatefulWidget {
   ReservaTurnoScreen({Key? key}) : super(key: key);

  @override
  State<ReservaTurnoScreen> createState() => _ReservaTurnoScreenState();
}

class _ReservaTurnoScreenState extends State<ReservaTurnoScreen> {
   late Future<List<ReservaModel>> currentReservas;

   ReservaService reservaService = ReservaService();

  String filtros='';

  setLista(ReservaDto? filtros){
    setState(() {
      if(filtros==null){
        currentReservas=reservaService.getReservas();
      }else{
        String json= jsonEncode(filtros.toJson());
        currentReservas=reservaService.getReservasFilter(json);
      }
    });

  }

  setFiltros(String value){
    filtros=value;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentReservas = reservaService.getReservas();
  }

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
            FilterReservaWidget(onFilter: setFiltros,setLista: setLista,),
            Expanded(child:ReservaScreen( json: filtros, lista: currentReservas) ),

          ],
        ),
    );
  }
}
