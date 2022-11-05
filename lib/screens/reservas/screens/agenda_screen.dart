import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/persona_model.dart';
import '../../../models/reserva_model.dart';
import '../../../services/persona_service.dart';
import '../../../services/reserva_service.dart';

class AgendaScreen extends StatefulWidget {
  AgendaScreen({
    Key? key,
    required this.title,
    required this.currentReserva,
    required this.fecha,
  }) : super(key: key);
  final String title;
  final List<ReservaModel> currentReserva;
  final String fecha;

  @override
  State<StatefulWidget> createState() => _AgendaScreen();
}

class _AgendaScreen extends State<AgendaScreen> {
  late Future<List<ReservaModel>> currentReserva;
  late Future<List<PersonaModel>> Clientes;
  PersonaService personaService = PersonaService();
  ReservaService reservaService = ReservaService();
  DateTime? FechaActual;
  PersonaModel? dropdownvalueClientes;
  String istapped = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    Clientes = personaService.getPersonas();
    currentReserva = reservaService.getAgenda(2, "20190903");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_outline,
                size: 30,
              ),
              Text(
                "  Empleado: ${widget.currentReserva[0].idEmpleado?.nombre.toString() ?? "Nombre"}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              // ElevatedButton
              Padding(padding: EdgeInsets.all(5),
                child:  ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      padding:
                      MaterialStateProperty.all(const EdgeInsets.all(5)),
                      textStyle: MaterialStateProperty.all(
                          const TextStyle(fontSize: 14, color: Colors.white))),
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Empleados'),
                        content: const Text('Seleccione un empleado'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  child: const Text('Cambiar')),)

            ],
          ),
          Row(
            children: [
              const Icon(
                CupertinoIcons.calendar,
                size: 30,
              ),
              Text(
                " Fecha: ${StringUtils.addCharAtPosition(StringUtils.addCharAtPosition(
                      widget.fecha,
                      "/",
                      4,
                    ), "/", 7)}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
              Padding(padding: const EdgeInsets.all(5), child:
              ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                          )
                      )
                  ),
                  onPressed: () {
                    setState(() {
                      istapped = 'Button tapped';
                    });
                  },
                  child: IconButton(icon: const Icon(CupertinoIcons.calendar_badge_plus),onPressed: ()=>{},)
              ),)
            ],
          ),
          Expanded(
              child: Scaffold(
            body: ListView.builder(
                itemCount: widget.currentReserva.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                      leading: const Icon(CupertinoIcons.clock),
                      trailing: const Text(
                        "Select",
                        style: TextStyle(color: Colors.green, fontSize: 15),
                      ),
                      title: Text(
                          "${StringUtils.addCharAtPosition(widget.currentReserva[index].horaInicioCadena, ":", 2)} - ${StringUtils.addCharAtPosition(widget.currentReserva[index].horaFinCadena, ":", 2)}"));
                }),
          )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FutureBuilder<List<PersonaModel>>(
                future: Clientes,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var data = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Text(
                                "Cliente:   ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                ),
                              ),
                              DropdownButton(
                                hint: const Text('Cliente...'),
                                items: data.map((item) {
                                  return DropdownMenuItem(
                                    value: item,
                                    child: Text(item.nombre.toString()),
                                  );
                                }).toList(),
                                onChanged: (newVal) {
                                  setState(() {
                                    dropdownvalueClientes = newVal;
                                  });
                                },
                                value: dropdownvalueClientes,
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  } else {
                    return const CircularProgressIndicator();
                  }
                },
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                iconSize: 50,
                color: Colors.blue,
                icon: const Icon(CupertinoIcons.add_circled),
                onPressed: () {},
              ),
              const Text('Agregar Reserva'),
            ],
          )
        ],
      ),
    );
  }
}