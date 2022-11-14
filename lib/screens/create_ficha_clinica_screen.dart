import 'package:flutter/material.dart';
import 'package:tp_front_end_segundo_parcial/models/ficha_clinica_dto.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'package:tp_front_end_segundo_parcial/models/tipo_producto_model.dart';

import '../services/ficha_clinica_service.dart';

class CreateFichaClinicaScreen extends StatefulWidget {
  final List<PersonaModel> personas;
  final List<TipoProductoModel> tiposProductos;

  const CreateFichaClinicaScreen({
    Key? key,
    required this.personas,
    required this.tiposProductos,
  }) : super(key: key);

  @override
  State<CreateFichaClinicaScreen> createState() =>
      _CreateFichaClinicaScreenState();
}

class _CreateFichaClinicaScreenState extends State<CreateFichaClinicaScreen> {
  String selectedCliente = "";
  String selectedEmpleado = "";
  String selectedTipoProducto = "";
  String motivoConsulta = "";
  String diagnostico = "";
  String observaciones = "";

  @override
  void initState() {
    super.initState();
    selectedCliente = widget.personas.first.nombre ?? "";
    selectedEmpleado = widget.personas.first.nombre ?? "";
    selectedTipoProducto = widget.tiposProductos.first.descripcion ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Ficha Clínica"),
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
            await fichaClinicaService.createFichaClinica(fichaClinicaDto);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Se creo correectamente"),
              ),
            );

            Navigator.of(context).pop();
          } catch (e) {
            print(e);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Error al crear la ficha clínica"),
              ),
            );
          }
        },
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text("Datos del Paciente"),
              const SizedBox(height: 20),
              TextFormField(
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
