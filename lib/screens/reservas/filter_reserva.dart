import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/models/reserva_dto.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_screen.dart';
import 'package:select_form_field/select_form_field.dart';
import 'package:intl/intl.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/reserva_turnos_screen.dart';

import '../../models/persona_model.dart';
import '../../services/persona_service.dart';

class FilterReservaWidget extends StatefulWidget {
  FilterReservaWidget({super.key, required this.onFilter,required this.setLista});

  Function(String value) onFilter;
  Function(ReservaDto value) setLista;
  @override
  State<StatefulWidget> createState() => _FilterReservaWidget();
}

class _FilterReservaWidget extends State<FilterReservaWidget> {
  final _formKey = GlobalKey<FormState>();
  PersonaModel? dropdownvalueEmpleados;
  PersonaModel? dropdownvalueClientes;
  TextEditingController dateInit = TextEditingController();
  TextEditingController dateEnd = TextEditingController();

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
                color: const Color.fromRGBO(1, 2, 3, .1),
                borderRadius: BorderRadius.circular(15.0)),

            child:Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                  key: _formKey,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Empleado:   ",
                                        style: TextStyle(
                                          fontFamily: "NEXA",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      DropdownButton(
                                        hint: const Text('Empleados...'),
                                        items: data.map((item) {
                                          return DropdownMenuItem(
                                            value: item,
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      const Text(
                                        "Cliente:   ",
                                        style: TextStyle(
                                          fontFamily: "NEXA",
                                          fontWeight: FontWeight.normal,
                                        ),
                                      ),
                                      DropdownButton(
                                        hint: const Text('Clientes...'),
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
                        TextField(
                          controller: dateEnd,
                          //editing controller of this TextField
                          decoration: const InputDecoration(
                              icon: Icon(Icons.calendar_month),
                              //icon of text field
                              labelText: "Fecha hasta:" //label text of field
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
                                dateEnd.text =
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
                          String values="";


                          if(dropdownvalueEmpleados != null){
                            values= '"idEmpleado":{"idPersona" : ${dropdownvalueEmpleados?.idPersona}}';
                          }
                          if(dropdownvalueClientes != null){
                           values= '$values "idCliente":{"idPersona" : ${dropdownvalueClientes?.idPersona}}';
                          }
                          String? init;
                          if(dateInit.text != ''){
                            List digit= dateInit.text.split("-");
                            init = "${digit[0]}${digit[1]}${digit[2]}";
                          }
                          String? end;
                          if(dateEnd.text != ''){
                            List digit= dateEnd.text.split("-");
                            end = "${digit[0]}${digit[1]}${digit[2]}";
                          }

                          ReservaDto dto= ReservaDto(
                              idEmpleado: dropdownvalueEmpleados?.idPersona.toString(),
                              idCliente: dropdownvalueClientes?.idPersona.toString(),
                              fechaDesdeCadena:init,
                              fechaHastaCadena: end,
                          );
                          values='{$values}';
                          var valuesEncode = Uri.encodeFull(values);
                          widget.onFilter(valuesEncode);
                          widget.setLista(dto);
                          ScaffoldMessenger.of(context).showSnackBar(
                             SnackBar(content: Text('Cargando datos:$valuesEncode')),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.blue,

                      ),
                      child: const Text('Filtrar', style: TextStyle(fontSize: 20),),
                    ),
                  ])),
            ),

          ),
        )
    );
  }
}
