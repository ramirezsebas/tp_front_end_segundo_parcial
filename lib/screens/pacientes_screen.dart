import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'package:tp_front_end_segundo_parcial/services/persona_service.dart';
import 'package:tp_front_end_segundo_parcial/widgets/card_footer.dart';
import 'package:tp_front_end_segundo_parcial/widgets/card_text.dart';
import 'package:tp_front_end_segundo_parcial/widgets/custom_card.dart';
import 'package:searchfield/searchfield.dart';

import '../core/utils/custom_dialog.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class PacientesScreen extends StatefulWidget {
  const PacientesScreen({Key? key}) : super(key: key);

  @override
  State<PacientesScreen> createState() => _PacientesScreenState();
}

class _PacientesScreenState extends State<PacientesScreen> {
  String nombreSearch = "";
  String apellidoSearch = "";

  SearchFieldListItem<PersonaModel>? initialValueCurrentNombre;
  SearchFieldListItem<PersonaModel>? initialValueCurrentApellido;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
    listapacientes = getPacientes();
  }

  late Future<List<PersonaModel>> listapacientes;

  Future<List<PersonaModel>> getPacientes() async {
    PersonaService personaService = PersonaService();

    final personas = await personaService.getPersonas();

    final fisioterapeutas = await personaService.getPersonasDelSistema();

    final set1 = Set.from(personas);
    final set2 = Set.from(fisioterapeutas);
    if (kDebugMode) {
      print(List<PersonaModel>.from(set1.difference(set2)));
    }

    final pacientes = List<PersonaModel>.from(set1.difference(set2));

    return pacientes;
  }

  Future<List<PersonaModel>> getPacientesFiltrado() async {
    var tmp = await getPacientes();
    if (nombreSearch != "") {
      tmp = tmp
          .where((element) => element.nombre!
              .toLowerCase()
              .contains(nombreSearch.toLowerCase()))
          .toList();
    }
    if (apellidoSearch != "") {
      tmp = tmp
          .where((element) => element.apellido != null
              ? element.apellido!
                  .toLowerCase()
                  .contains(apellidoSearch.toLowerCase())
              : false)
          .toList();
    }
    return tmp;
  }

  deletePaciente(int id) async {
    try {
      bool? eliminatePaciente = await showMyDialog(context,
          title: 'Deseas eliminar el paciente seleccionada?');
      if (eliminatePaciente != null && eliminatePaciente) {
        PersonaService service = PersonaService();
        bool isPacienteEliminated = await service.deletePersona(id);

        if (isPacienteEliminated) {
          setState(() {
            listapacientes = getPacientes();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Paciente eliminada correctamente'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al eliminar el paciente'),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<PersonaModel>>(
          future: listapacientes,
          initialData: const [],
          builder: (BuildContext context,
              AsyncSnapshot<List<PersonaModel>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final pacientes = snapshot.data!;

                return RefreshIndicator(
                  onRefresh: () {
                    setState(() {
                      listapacientes = getPacientes();
                    });
                    initialValueCurrentNombre = null;
                    initialValueCurrentApellido = null;
                    return Future.value(true);
                  },
                  child: Column(
                    children: [
                      SearchField(
                        hint: 'Nombre',
                        suggestions: pacientes
                            .map(
                              (e) => SearchFieldListItem<PersonaModel>(
                                e.nombre != null ? e.nombre! : '',
                                item: e,
                              ),
                            )
                            .toList(),
                        onSubmit: (nombre) => (nombre) {
                          if (kDebugMode) {
                            print(nombre);
                          }
                        },
                        onSuggestionTap: (nombre) {
                          if (kDebugMode) {
                            print(nombre.searchKey);
                            print(nombre.searchKey);
                          }
                          nombreSearch = nombre.searchKey;
                          initialValueCurrentNombre = nombre;
                          setState(() {
                            listapacientes = getPacientesFiltrado();
                          });
                        },
                        initialValue: initialValueCurrentNombre,
                      ),
                      SearchField(
                        hint: 'Apellido',
                        suggestions: pacientes
                            .map(
                              (e) => SearchFieldListItem<PersonaModel>(
                                e.apellido != null ? e.apellido! : '',
                                item: e,
                              ),
                            )
                            .toList(),
                        onSubmit: (apellido) => (apellido) {
                          if (kDebugMode) {
                            print(apellido);
                          }
                        },
                        onSuggestionTap: (apellido) async {
                          if (kDebugMode) {
                            print(apellido.searchKey);
                          }
                          apellidoSearch = apellido.searchKey;
                          initialValueCurrentApellido = apellido;
                          setState(() {
                            listapacientes = getPacientesFiltrado();
                          });
                        },
                        initialValue: initialValueCurrentApellido,
                      ),
                      Expanded(
                        child: ListView.builder(
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount: pacientes.length,
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (BuildContext context, int index) {
                            final currentPaciente = pacientes[index];
                            return CustomCard(
                                cardData: Column(
                              children: [
                                CardText(
                                    label: "Nombre",
                                    text:
                                        '${currentPaciente.nombre.toString()} ${currentPaciente.apellido.toString()}'),
                                CardText(
                                    label: "Email",
                                    text: currentPaciente.email.toString()),
                                CardText(
                                    label: "Teléfono",
                                    text: currentPaciente.telefono.toString()),
                                CardText(
                                    label: "RUC",
                                    text: currentPaciente.ruc.toString()),
                                CardText(
                                    label: "Cédula",
                                    text: currentPaciente.cedula.toString()),
                                CardText(
                                    label: "Tipo de Persona",
                                    text:
                                        currentPaciente.tipoPersona.toString()),
                                CardText(
                                    label: "Fecha de Nacimiento",
                                    text: currentPaciente.fechaNacimiento
                                        .toString()),
                                CardFooter(
                                  onDelete: () => deletePaciente(
                                      currentPaciente.idPersona!),
                                )
                              ],
                            ));
                          },
                        ),
                      ),
                    ],
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
          }),
    );
  }
}
