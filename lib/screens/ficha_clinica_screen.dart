import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/screens/update_ficha_clinica_screen.dart';
import 'package:tp_front_end_segundo_parcial/services/ficha_clinica_service.dart';
import 'package:tp_front_end_segundo_parcial/widgets/custom_card.dart';

import '../core/utils/custom_dialog.dart';
import '../models/ficha_clinica_model.dart';
import '../services/persona_service.dart';
import '../services/tipo_producto_service.dart';
import '../widgets/card_footer.dart';
import '../widgets/card_text.dart';

class FichaClinicaScreen extends StatefulWidget {
  const FichaClinicaScreen({Key? key}) : super(key: key);

  @override
  State<FichaClinicaScreen> createState() => _FichaClinicaScreenState();
}

class _FichaClinicaScreenState extends State<FichaClinicaScreen> {
  Future<List<FichaClinicaModel>>? _futureFichasClinicas;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _futureFichasClinicas = getFichasClinicas();
  }

  Future<List<FichaClinicaModel>> getFichasClinicas() async {
    FichaClinicaService fichaClinicaService = FichaClinicaService();

    final fichas = await fichaClinicaService.getFichasClinicas();

    return fichas;
  }

  deleteFichaClinica(int id) async {
    try {
      bool? eliminateFicha = await showMyDialog(context,
          title: 'Deseas eliminar la ficha seleccionada?');
      if (eliminateFicha != null && eliminateFicha) {
        FichaClinicaService service = FichaClinicaService();
        bool isFichaEliminated = await service.deleteFichaClinica(id);

        if (!mounted) {
          return;
        }

        if (isFichaEliminated) {
          setState(() {
            _futureFichasClinicas = getFichasClinicas();
          });
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Ficha eliminada correctamente'),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Error al eliminar la ficha'),
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
      body: FutureBuilder<List<FichaClinicaModel>>(
        future: _futureFichasClinicas,
        initialData: const [],
        builder: (BuildContext context,
            AsyncSnapshot<List<FichaClinicaModel>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final fichas = snapshot.data!;

              return RefreshIndicator(
                onRefresh: () => getFichasClinicas(),
                child: ListView.builder(
                  itemCount: fichas.length,
                  padding: const EdgeInsets.all(8),
                  itemBuilder: (BuildContext context, int index) {
                    final currentFicha = fichas[index];
                    return CustomCard(
                      cardData: Column(
                        children: [
                          CardText(
                            label: "ID Ficha",
                            text: currentFicha.idFichaClinica.toString(),
                          ),
                          CardText(
                            label: "Fecha y Hora",
                            text: currentFicha.fechaHora.toString(),
                          ),
                          CardText(
                            label: "Motivo de Consulta",
                            text: currentFicha.motivoConsulta.toString(),
                          ),
                          CardText(
                            label: "Diagnostico",
                            text: currentFicha.diagnostico.toString(),
                          ),
                          CardText(
                            label: "Observacion",
                            text: currentFicha.observacion.toString(),
                          ),
                          CardText(
                            label: "Local",
                            text: currentFicha.idLocal?.nombreEmpresa ??
                                "Nombre del Local identificado",
                          ),
                          CardText(
                            label: "Empleado",
                            text: currentFicha.idEmpleado?.nombre ??
                                "Nombre del Empleado identificado",
                          ),
                          CardText(
                            label: "Cliente",
                            text: currentFicha.idCliente?.nombre ??
                                "Nombre del Cliente identificado",
                          ),
                          CardFooter(
                            onEdit: () async {
                              final PersonaService personaService =
                                  PersonaService();
                              final TipoProductoService tipoProductoService =
                                  TipoProductoService();

                              final personas =
                                  await personaService.getPersonas();
                              final tiposProductos =
                                  await tipoProductoService.getTipoProductos();

                              if (!mounted) {
                                return;
                              }
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      UpdateFichaClinicaScreen(
                                    idFichaClinica:
                                        currentFicha.idFichaClinica.toString(),
                                    fichaClinica:
                                        currentFicha.toFichaClinicaDto(),
                                    personas: personas,
                                    tiposProductos: tiposProductos,
                                  ),
                                ),
                              );
                            },
                            onDelete: () => deleteFichaClinica(
                              currentFicha.idFichaClinica!,
                            ),
                          ),
                        ],
                      ),
                    );
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
    );
  }
}
