import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tp_front_end_segundo_parcial/services/persona_service.dart';

class CreatePacienteScreen extends StatefulWidget {
  const CreatePacienteScreen({Key? key}) : super(key: key);

  @override
  State<CreatePacienteScreen> createState() => _CreatePacienteScreenState();
}

class _CreatePacienteScreenState extends State<CreatePacienteScreen> {
  final _formKey = GlobalKey<FormState>();
  static const List<String> list = <String>['FISICA', 'JURIDICA'];
  String dropdownValue = list.first;
  PersonaService personaService = PersonaService();

  @override
  Widget build(BuildContext context) {
    PersonaModel personaModel = PersonaModel.defaultConst();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Paciente"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Datos del Paciente"),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Nombre",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    personaModel.nombre = value.toString();
                    if (kDebugMode) {
                      print(personaModel.toJson());
                    }
                  },
                  validator: (value) {
                    if (value!.contains(RegExp(r'[0-9]'))) {
                      return 'Ingrese solo letras por favor';
                    } else if (value.isEmpty) {
                      return 'Por favor complete este campo';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    personaModel.nombre = value.toString();
                  },
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Apellido",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      personaModel.apellido = value.toString();
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    validator: (value) {
                      if (value!.contains(RegExp(r'[0-9]'))) {
                        return 'Ingrese solo letras por favor';
                      } else if (value.isEmpty) {
                        return 'Por favor complete este campo';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personaModel.apellido = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Teléfono",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      personaModel.telefono = value.toString();
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor complete este campo';
                      } else if (!value.contains(RegExp(r'^[0-9]+$'))) {
                        return 'Ingrese solo números por favor';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personaModel.telefono = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      personaModel.email = value.toString();
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor complete este campo';
                      } else if (!EmailValidator.validate(value.toString())) {
                        return 'Email inválido';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personaModel.email = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "RUC",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      personaModel.ruc = value.toString();
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor complete este campo';
                      } else if (!value
                          .contains(RegExp(r'^(([0-9])+(-[0-9])?)$'))) {
                        return 'Ingrese un RUC válido por favor';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      personaModel.ruc = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Cédula",
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      personaModel.cedula = value.toString();
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Por favor complete este campo';
                      } else if (!value.contains(RegExp(r'^[0-9]+$'))) {
                        return 'Ingrese solo números por favor';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      personaModel.cedula = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DropdownButtonFormField(
                    items: list.map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    isExpanded: true,
                    hint: const Text('Tipo de persona'),
                    onChanged: (String? value) {
                      personaModel.tipoPersona = value!;
                      // This is called when the user selects an item.
                      setState(() {
                        dropdownValue = value;
                      });
                      if (kDebugMode) {
                        print(personaModel.toJson());
                      }
                    },
                    decoration: const InputDecoration(
                      labelText: "Tipo de persona",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null) {
                        return 'Por favor complete este campo';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      personaModel.tipoPersona = value;
                    },
                  )),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: DateTimePicker(
                  firstDate: DateTime(1900),
                  initialDate:
                      DateTime.now().subtract(const Duration(days: 18 * 365)),
                  lastDate:
                      DateTime.now().subtract(const Duration(days: 18 * 365)),
                  dateLabelText: 'Fecha de nacimiento',
                  dateMask: 'dd/MM/yyyy hh:mm:ss',
                  onChanged: (String val) {
                    personaModel.fechaNacimiento =
                        DateTime.parse('$val 00:00:00');
                    if (kDebugMode) {
                      print(personaModel.toJson());
                    }
                  },
                  validator: (val) {
                    print('Validando $val');
                    return null;
                  },
                  onSaved: (value) {
                    personaModel.fechaNacimiento =
                        DateTime.parse('$value 00:00:00');
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the
                          // real world, you'd often call a server or save the
                          // information in a database.
                          _formKey.currentState!.save();
                          if (kDebugMode) {
                            print('persona a mandar: ${personaModel.toJson()}');
                          }
                          personaService.createPersona(personaModel).then(
                                (String value) => ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                        SnackBar(content: Text(value))),
                              );
                        }
                      },
                      child: const Text('Crear')),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
