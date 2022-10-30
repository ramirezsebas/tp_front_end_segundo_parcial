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
    return Card(
      color: Colors.grey,
      shadowColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: const BorderSide(color: Colors.transparent, width: 1),
      ),
      // Container(
      //   height: 200.0,
      //   alignment: const Alignment(-1,-1),
      //   child:  Text(idReserva,
      //     style: const TextStyle(
      //       color: Colors.white,
      //       fontSize: 15.0,
      //       fontFamily: "Tamil Sangam MN",
      //     ),
      //   ),
      // ),
      child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Column(
                        children: [
                          Text("Empleado:  "),
                          Text(Empleado,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "Tamil Sangam MN",)
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Text("Fecha:  "),
                          Text(fecha,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "Tamil Sangam MN",)
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
                                color: Colors.white,
                                fontSize: 15.0,
                                fontFamily: "Tamil Sangam MN",)
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
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Tamil Sangam MN",)
                              ),
                              Text("$horaFin",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15.0,
                                    fontFamily: "Tamil Sangam MN",)
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                ],
              ),
            ],
          )
      ),

    );
  }

  Widget formObservacion() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              hintText: 'Enter your email',
            ),
            validator: (String? value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
