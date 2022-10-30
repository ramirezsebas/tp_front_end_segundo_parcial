import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'dart:convert';

import 'package:tp_front_end_segundo_parcial/models/tipo_producto_model.dart';

import 'clinica_local_model.dart';

ReservaModel fichaClinicaModelFromJson(String str) =>
    ReservaModel.fromJson(json.decode(str));

String fichaClinicaModelToJson(ReservaModel data) =>
    json.encode(data.toJson());

class ReservaModel {
  ReservaModel({
    required this.idReserva,
    required this.fecha,
    required this.horaInicio,
    required this.horaFin,
    required this.idEmpleado,
    required this.idCliente,
  });

  final int? idReserva;
  final DateTime? fecha;
  final String? horaInicio;
  final String? horaFin;
  final PersonaModel? idEmpleado;
  final PersonaModel? idCliente;

  factory ReservaModel.fromJson(Map<String, dynamic> json) =>
      ReservaModel(
        idReserva: json["idReserva"],
        fecha: json["fecha"] == null
            ? null
            : DateTime.parse(json["fecha"]),
        horaInicio: json["horaInicio"],
        horaFin: json["horaFin"],
        idEmpleado: json["idEmpleado"] == null
            ? null
            : PersonaModel.fromJson(json["idEmpleado"]),
        idCliente: json["idCliente"] == null
            ? null
            : PersonaModel.fromJson(json["idCliente"]),
      );

  Map<String, dynamic> toJson() => {
        "idReserva": idReserva,
        "fecha": fecha ?? fecha!.toIso8601String(),
        "horaInicio": horaInicio,
        "horaFin": horaFin,
        "idEmpleado": idEmpleado ?? idEmpleado!.toJson(),
        "idCliente": idCliente ?? idCliente!.toJson(),
      };
}
