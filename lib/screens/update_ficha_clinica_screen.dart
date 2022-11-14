import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/models/ficha_clinica_dto.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'package:tp_front_end_segundo_parcial/models/tipo_producto_model.dart';

import '../services/ficha_clinica_service.dart';

class UpdateFichaClinicaScreen extends StatefulWidget {
  final List<PersonaModel> personas;
  final String idFichaClinica;
  final List<TipoProductoModel> tiposProductos;
  final FichaClinicaDto fichaClinica;

  const UpdateFichaClinicaScreen({
    Key? key,
    required this.personas,
    required this.idFichaClinica,
    required this.tiposProductos,
    required this.fichaClinica,
  }) : super(key: key);

  @override
  State<UpdateFichaClinicaScreen> createState() =>
      _UpdateFichaClinicaScreenState();
}

class _UpdateFichaClinicaScreenState extends State<UpdateFichaClinicaScreen> {
  String selectedCliente = "";
  String selectedEmpleado = "";
  String selectedTipoProducto = "";
  String motivoConsulta = "";
  String diagnostico = "";
  String observaciones = "";

  updateFichaClinica(String idFichaClinica) async {
    final fichaClinicaService = FichaClinicaService();
    final fichaClinicaDto = FichaClinicaDto(
      motivoConsulta: motivoConsulta,
      diagnostico: diagnostico,
      observacion: observaciones,
      idEmpleado: selectedEmpleado,
      idCliente: selectedCliente,
      idTipoProducto: selectedTipoProducto,
    );
    try {
      await fichaClinicaService.updateFichaClinica(
          idFichaClinica, fichaClinicaDto);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Se creo correectamente"),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Error al crear"),
        ),
      );
    }
  }

  @override
  void initState() {
    super.initState();
    selectedCliente = widget.fichaClinica.idCliente;
    selectedEmpleado = widget.fichaClinica.idEmpleado;
    selectedTipoProducto = widget.fichaClinica.idTipoProducto;
    motivoConsulta = widget.fichaClinica.motivoConsulta;
    diagnostico = widget.fichaClinica.diagnostico;
    observaciones = widget.fichaClinica.observacion;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Actualizar Ficha Clínica"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final fichaClinicaService = FichaClinicaService();
          final fichaClinicaDto = FichaClinicaDto(
            motivoConsulta: motivoConsulta,
            diagnostico: diagnostico,
            observacion: observaciones,
            idEmpleado: selectedEmpleado,
            idCliente: selectedCliente,
            idTipoProducto: selectedTipoProducto,
          );
          try {
            await fichaClinicaService.updateFichaClinica(
                widget.idFichaClinica, fichaClinicaDto);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Se actualizo correectamente"),
              ),
            );

            Navigator.of(context).pop();
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error al actualizar la ficha clínica"),
              ),
            );
          }
        },
        child: const Icon(Icons.update),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Datos del Paciente"),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: widget.fichaClinica.motivoConsulta,
                onChanged: (value) {
                  motivoConsulta = value;
                },
                decoration: const InputDecoration(
                  labelText: "Motivo de la Consulta",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: widget.fichaClinica.diagnostico,
                onChanged: (value) {
                  diagnostico = value;
                },
                decoration: const InputDecoration(
                  labelText: "Diagnostico",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: widget.fichaClinica.observacion,
                onChanged: (value) {
                  observaciones = value;
                },
                decoration: const InputDecoration(
                  labelText: "Observacion",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                // value: widget.fichaClinica.idEmpleado,
                hint: const Text("Seleccione un empleado"),
                items: widget.personas
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.idPersona,
                        child: Text(e.nombre ?? ""),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedEmpleado = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                // value: widget.fichaClinica.idCliente,
                hint: const Text("Seleccione un cliente"),
                items: widget.personas
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.idPersona,
                        child: Text(e.nombre ?? ""),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCliente = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                // value: widget.fichaClinica.idTipoProducto,
                hint: const Text("Seleccione un tipo de producto"),
                items: widget.tiposProductos
                    .map(
                      (e) => DropdownMenuItem(
                        value: e.idTipoProducto,
                        child: Text(e.descripcion ?? ""),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedTipoProducto = value.toString();
                  });
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
