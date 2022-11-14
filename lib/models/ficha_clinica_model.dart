// To parse this JSON data, do
//
//     final fichaClinicaModel = fichaClinicaModelFromJson(jsonString);

import 'package:tp_front_end_segundo_parcial/models/ficha_clinica_dto.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';
import 'dart:convert';

import 'package:tp_front_end_segundo_parcial/models/tipo_producto_model.dart';

import 'clinica_local_model.dart';

FichaClinicaModel fichaClinicaModelFromJson(String str) =>
    FichaClinicaModel.fromJson(json.decode(str));

String fichaClinicaModelToJson(FichaClinicaModel data) =>
    json.encode(data.toJson());

class FichaClinicaModel {
  FichaClinicaModel({
    required this.idFichaClinica,
    required this.fechaHora,
    required this.motivoConsulta,
    required this.diagnostico,
    required this.observacion,
    required this.idLocal,
    required this.idEmpleado,
    required this.idCliente,
    required this.idTipoProducto,
    required this.fechaHoraCadena,
    required this.fechaHoraCadenaFormateada,
    required this.fechaDesdeCadena,
    required this.fechaHastaCadena,
    required this.todosLosCampos,
  });

  final int? idFichaClinica;
  final DateTime? fechaHora;
  final String? motivoConsulta;
  final String? diagnostico;
  final String? observacion;
  final ClinicaLocalModel? idLocal;
  final PersonaModel? idEmpleado;
  final PersonaModel? idCliente;
  final TipoProductoModel? idTipoProducto;
  final String? fechaHoraCadena;
  final String fechaHoraCadenaFormateada;
  final dynamic fechaDesdeCadena;
  final dynamic fechaHastaCadena;
  final dynamic todosLosCampos;

  factory FichaClinicaModel.fromJson(Map<String, dynamic> json) =>
      FichaClinicaModel(
        idFichaClinica: json["idFichaClinica"],
        fechaHora: json["fechaHora"] == null
            ? null
            : DateTime.parse(json["fechaHora"]),
        motivoConsulta: json["motivoConsulta"],
        diagnostico: json["diagnostico"],
        observacion: json["observacion"],
        idLocal: json["idLocal"] == null
            ? null
            : ClinicaLocalModel.fromJson(json["idLocal"]),
        idEmpleado: json["idEmpleado"] == null
            ? null
            : PersonaModel.fromJson(json["idEmpleado"]),
        idCliente: json["idCliente"] == null
            ? null
            : PersonaModel.fromJson(json["idCliente"]),
        idTipoProducto: json["idTipoProducto"] == null
            ? null
            : TipoProductoModel.fromJson(json["idTipoProducto"]),
        fechaHoraCadena: json["fechaHoraCadena"],
        fechaHoraCadenaFormateada: json["fechaHoraCadenaFormateada"],
        fechaDesdeCadena: json["fechaDesdeCadena"],
        fechaHastaCadena: json["fechaHastaCadena"],
        todosLosCampos: json["todosLosCampos"],
      );

  Map<String, dynamic> toJson() => {
        "idFichaClinica": idFichaClinica,
        "fechaHora": fechaHora ?? fechaHora!.toIso8601String(),
        "motivoConsulta": motivoConsulta,
        "diagnostico": diagnostico,
        "observacion": observacion,
        "idLocal": idLocal ?? idLocal!.toJson(),
        "idEmpleado": idEmpleado ?? idEmpleado!.toJson(),
        "idCliente": idCliente ?? idCliente!.toJson(),
        "idTipoProducto": idTipoProducto ?? idTipoProducto!.toJson(),
        "fechaHoraCadena": fechaHoraCadena,
        "fechaHoraCadenaFormateada": fechaHoraCadenaFormateada,
        "fechaDesdeCadena": fechaDesdeCadena,
        "fechaHastaCadena": fechaHastaCadena,
        "todosLosCampos": todosLosCampos,
      };

  FichaClinicaDto toFichaClinicaDto() {
    return FichaClinicaDto(
      motivoConsulta: motivoConsulta ?? "",
      diagnostico: diagnostico ?? "",
      observacion: observacion ?? "",
      idEmpleado: idEmpleado?.idPersona.toString() ?? "",
      idCliente: idCliente?.idPersona.toString() ?? "",
      idTipoProducto: idTipoProducto?.idTipoProducto.toString() ?? "",
    );
  }

  toDto() {
    return {
      "motivoConsulta": motivoConsulta,
      "diagnostico": diagnostico,
      "observaciones": observacion,
      "idEmpleado": idEmpleado,
      "idCliente": idCliente,
      "idTipoProducto": idTipoProducto,
    };
  }
}
