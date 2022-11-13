import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/header_appbar.dart';
import 'package:tp_front_end_segundo_parcial/services/reserva_service.dart';
import 'package:tp_front_end_segundo_parcial/widgets/custom_card.dart';

import '../../core/utils/custom_dialog.dart';
import '../../models/reserva_model.dart';
import '../../widgets/card_footer.dart';
import '../../widgets/card_text.dart';
import 'widgets/custom_card_reserva.dart';

class ReservaScreen extends StatefulWidget {
  ReservaScreen({Key? key,
    required this.json}) : super(key: key);
  String json;

  @override
  State<ReservaScreen> createState() => _ReservaScreenState();
}

class _ReservaScreenState extends State<ReservaScreen> {
  late Future<List<ReservaModel>> currentReservas;
  ReservaService reservaService = ReservaService();
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // currentReservas=reservaService.getReservas();
  }

  @override
  void initState() {
    super.initState();
    // Clientes = personaService.getPersonas();
    if(widget.json=="") {
      print(widget.json);
      currentReservas = reservaService.getReservas();
    }else{
      print("entro aca");
      currentReservas = reservaService.getReservasFilter(widget.json);
    }
  }


  deleteReserva(int id) async {
    try {
      bool? eliminateReserva = await showMyDialog(context,
          title: 'Deseas eliminar la reserva seleccionada?');
      if (eliminateReserva != null && eliminateReserva) {
        ReservaService service = ReservaService();
        bool isReservaEliminated = await service.deleteReserva(id);

        if (isReservaEliminated) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reserva eliminada correctamente'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al eliminar la Reserva'),
            ),
          );
        }
      }
    } on DioError catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.response?.data ?? "No se pudo eliminar"),
        ),
      );
    }
  }


  final description = Container(
    margin: const EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
    child: const Text(
      "dsfd",
      style: TextStyle(fontFamily: "TODAY", fontSize: 11.0),
      textAlign: TextAlign.justify,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
        child: Center(
          child: Container(
            height: 450,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(0, 0, 0, 0.05),
                borderRadius: BorderRadius.circular(10.0)),
            child:Padding(
              padding: const EdgeInsets.all(10),
              child: FutureBuilder<List<ReservaModel>>(
                future: currentReservas,
                initialData: const [],
                builder: (BuildContext context, AsyncSnapshot<List<ReservaModel>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      final reservas = snapshot.data!;
                      return RefreshIndicator(
                        onRefresh: () => currentReservas,
                        child: ListView.builder(
                          itemCount: reservas.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (BuildContext context, int index) {
                            final currentReserva = reservas[index];
                            return CustomCardReserva(
                                cardData: CardFooter(onDelete: () => deleteReserva(currentReserva.idReserva!)),
                                idReserva: currentReserva.idReserva.toString() ,
                                fecha: currentReserva.fecha.toString().split(" ")[0],
                                horaInicio: currentReserva.horaInicio.toString(),
                                horaFin: currentReserva.horaFin.toString(),
                                Empleado: currentReserva.idEmpleado?.nombre ?? "Nombre del Empleado identificado",
                                Cliente: currentReserva.idCliente?.nombre ?? "Nombre del Cliente identificado");
                          },
                        ),
                      );
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
            ),

          ),
        )
    );
  }
}
