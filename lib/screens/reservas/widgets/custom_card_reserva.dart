import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/reservas/widgets/button_green.dart';

class CustomCardReserva extends StatelessWidget {
  CustomCardReserva({
    Key? key,
    required this.cardData, required this.idReserva, required this.fecha, required this.horaInicio, required this.horaFin, required this.Empleado, required this.Cliente,
  }) : super(key: key);

  final Widget cardData;
  final String idReserva;
  final String fecha;
  final String horaInicio;
  final String horaFin;
  final String Empleado;
  final String Cliente;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    List<bool> _selections = List.generate(2, (_)=>false );

    return Column(
      children: [
            Card(
              color: Colors.white,
              shadowColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
                side: const BorderSide(color: Colors.transparent, width: 1),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                // ToggleButtons(
                                //   isSelected:_selections,
                                //   color:Colors.teal,
                                //   fillColor:Colors.deepPurple,
                                //   children: const <Widget>[
                                //     Icon(Icons.check_box),
                                //     Icon(Icons.check_box_outline_blank),
                                //   ],
                                // ),
                                Column(
                                  children: [
                                    Text("Empleado:  "),
                                    Text(Empleado,
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "NEXA",)
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Fecha:  "),
                                    Text(fecha,
                                        style: const TextStyle(
                                          fontSize: 15.0,
                                          fontFamily: "NEXA",)
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Cliente:  "),
                                    Text(Cliente,
                                        style: const TextStyle(

                                          fontSize: 15.0,
                                          fontFamily: "NEXA",)
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Text("Horario:  "),
                                    Row(
                                      children: [
                                        Text("$horaInicio - ",
                                            style: const TextStyle(

                                              fontSize: 15.0,
                                              fontFamily: "NEXA",)
                                        ),
                                        Text("$horaFin",
                                            style: const TextStyle(
                                              fontSize: 15.0,
                                              fontFamily: "NEXA",)
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        ButtonGreen(text: "X", onPressed: ()=>{}, height:20, width: 20),
                      ],
                    )
                  ),
                  formObservacion(),
                ],
              )
            ),
      ],
    );
  }

  Widget formObservacion() {
    return Form(
      key: _formKey,
      child: Expanded(
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Observacion',
              ),
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'campo requerido';
                }
                return null;
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Validate will return true if the form is valid, or false if
                  // the form is invalid.
                  if (_formKey.currentState!.validate()) {
                    // Process data.
                  }
                },
                child: const Text('Enviar'),
              ),
            ),
          ],
        ),
      ),
    );
  }


}
