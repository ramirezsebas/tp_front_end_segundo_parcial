import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/persona_model.dart';
import '../../services/persona_service.dart';

class FilterAgendaWidget extends StatefulWidget {
  const FilterAgendaWidget({super.key});

  @override
  State<StatefulWidget> createState() => _FilterAgendaWidget();
}

class _FilterAgendaWidget extends State<FilterAgendaWidget> {
  final _formKey = GlobalKey<FormState>();
  String? dropdownvalueEmpleados;
  String? dropdownvalueClientes;
  TextEditingController dateInit = TextEditingController();
  TextEditingController dateEnd = TextEditingController();
  PersonaModel? EmpleadoActual;
  DateTime? FechaActual;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    getPersonas();
  }

  @override
  void initState() {
    dateInit.text = "";
    dateEnd.text = "";
    super.initState();
  }

  Future<List<PersonaModel>> getPersonas() async {
    PersonaService personaService = PersonaService();

    final personas = await personaService.getPersonas();

    return personas;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Container(
              height: 250,
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(0, 0, 0, 0.05),
                  borderRadius: BorderRadius.circular(10.0)),
              child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FutureBuilder<List<PersonaModel>>(
                              future: getPersonas(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var data = snapshot.data!;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Empleado:   ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      DropdownButton(
                                        hint: const Text('Empleados...'),
                                        items: data.map((item) {
                                          return DropdownMenuItem(
                                            value: item.idPersona.toString(),
                                            child: Text(item.nombre.toString()),
                                          );
                                        }).toList(),
                                        onChanged: (newVal) {
                                          setState(() {
                                            dropdownvalueEmpleados = newVal;
                                          });
                                        },
                                        value: dropdownvalueEmpleados,
                                      )
                                    ],
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                            FutureBuilder<List<PersonaModel>>(
                              future: getPersonas(),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  var data = snapshot.data!;
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Cliente:   ",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      DropdownButton(
                                        hint: const Text('Clientes...'),
                                        items: data.map((item) {
                                          return DropdownMenuItem(
                                            value: item.toString(),
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
                                  );
                                } else {
                                  return const CircularProgressIndicator();
                                }
                              },
                            ),
                          ],
                        ),
                        TextField(
                          controller: dateInit,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_month),
                              //icon of text field
                              labelText: "Fecha desde:" //label text of field
                              ),
                          readOnly: true,
                          //set it true, so that user will not able to edit text
                          onTap: () async {
                            DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2000),
                                //DateTime.now() - not to allow to choose before today.
                                lastDate: DateTime(2101));

                            if (pickedDate != null) {
                              print(
                                  pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                              String formattedDate =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                              print(
                                  formattedDate); //formatted date output using intl package =>  2021-03-16
                              //you can implement different kind of Date Format here according to your requirement

                              setState(() {
                                dateInit.text =
                                    formattedDate; //set output date to TextField value.
                              });
                            } else {
                              print("Fecha no seleccionada");
                            }
                          },
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Validate returns true if the form is valid, or false otherwise.
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Cargando datos:${dropdownvalueClientes!}')),
                          );
                        }
                      },
                      child: const Text('Obtener horario'),
                    ),
                  ]))),
        ));
  }
}
