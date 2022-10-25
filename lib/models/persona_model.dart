// To parse this JSON data, do
//
//     final personaModel = personaModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

PersonaModel personaModelFromJson(String str) =>
    PersonaModel.fromJson(json.decode(str));

String personaModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel extends Equatable {
  const PersonaModel({
    required this.idPersona,
    required this.nombre,
    required this.apellido,
    required this.email,
    required this.telefono,
    required this.seguroMedico,
    required this.seguroMedicoNumero,
    required this.ruc,
    required this.cedula,
    required this.tipoPersona,
    required this.usuarioLogin,
    required this.idLocalDefecto,
    required this.flagVendedor,
    required this.flagTaxfree,
    required this.flagExcepcionChequeoVenta,
    required this.observacion,
    required this.direccion,
    required this.idCiudad,
    required this.tipoCliente,
    required this.fechaHoraAprobContrato,
    required this.soloUsuariosDelSistema,
    required this.soloPersonasTaxfree,
    required this.nombreCompleto,
    required this.limiteCredito,
    this.fechaNacimiento,
    required this.soloProximosCumpleanhos,
    required this.todosLosCampos,
    required this.incluirLimiteDeCredito,
    required this.deuda,
    required this.saldo,
    required this.creditos,
  });

  final num? idPersona;
  final String? nombre;
  final String? apellido;
  final String? email;
  final dynamic seguroMedico;
  final String? telefono;
  final dynamic seguroMedicoNumero;
  final String? ruc;
  final String? cedula;
  final String? tipoPersona;
  final dynamic usuarioLogin;
  final dynamic idLocalDefecto;
  final String? flagVendedor;
  final dynamic flagTaxfree;
  final String? flagExcepcionChequeoVenta;
  final dynamic observacion;
  final dynamic direccion;
  final dynamic idCiudad;
  final String? tipoCliente;
  final dynamic fechaHoraAprobContrato;
  final dynamic soloUsuariosDelSistema;
  final dynamic soloPersonasTaxfree;
  final String? nombreCompleto;
  final num? limiteCredito;
  final DateTime? fechaNacimiento;
  final dynamic soloProximosCumpleanhos;
  final dynamic todosLosCampos;
  final dynamic incluirLimiteDeCredito;
  final dynamic deuda;
  final dynamic saldo;
  final dynamic creditos;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        seguroMedico: json["seguroMedico"],
        seguroMedicoNumero: json["seguroMedicoNumero"],
        ruc: json["ruc"],
        cedula: json["cedula"],
        tipoPersona: json["tipoPersona"],
        usuarioLogin: json["usuarioLogin"],
        idLocalDefecto: json["idLocalDefecto"],
        flagVendedor: json["flagVendedor"],
        flagTaxfree: json["flagTaxfree"],
        flagExcepcionChequeoVenta: json["flagExcepcionChequeoVenta"],
        observacion: json["observacion"],
        direccion: json["direccion"],
        idCiudad: json["idCiudad"],
        tipoCliente: json["tipoCliente"],
        fechaHoraAprobContrato: json["fechaHoraAprobContrato"],
        soloUsuariosDelSistema: json["soloUsuariosDelSistema"],
        soloPersonasTaxfree: json["soloPersonasTaxfree"],
        nombreCompleto: json["nombreCompleto"],
        limiteCredito: json["limiteCredito"],
        fechaNacimiento: json["fechaNacimiento"] == null
            ? null
            : DateTime.parse(json["fechaNacimiento"]),
        soloProximosCumpleanhos: json["soloProximosCumpleanhos"],
        todosLosCampos: json["todosLosCampos"],
        incluirLimiteDeCredito: json["incluirLimiteDeCredito"],
        deuda: json["deuda"],
        saldo: json["saldo"],
        creditos: json["creditos"],
      );

  Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
        "seguroMedico": seguroMedico,
        "seguroMedicoNumero": seguroMedicoNumero,
        "ruc": ruc,
        "cedula": cedula,
        "tipoPersona": tipoPersona,
        "usuarioLogin": usuarioLogin,
        "idLocalDefecto": idLocalDefecto,
        "flagVendedor": flagVendedor,
        "flagTaxfree": flagTaxfree,
        "flagExcepcionChequeoVenta": flagExcepcionChequeoVenta,
        "observacion": observacion,
        "direccion": direccion,
        "idCiudad": idCiudad,
        "tipoCliente": tipoCliente,
        "fechaHoraAprobContrato": fechaHoraAprobContrato,
        "soloUsuariosDelSistema": soloUsuariosDelSistema,
        "soloPersonasTaxfree": soloPersonasTaxfree,
        "nombreCompleto": nombreCompleto,
        "limiteCredito": limiteCredito,
        "fechaNacimiento": fechaNacimiento == null
            ? null
            : "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')}",
        "soloProximosCumpleanhos": soloProximosCumpleanhos,
        "todosLosCampos": todosLosCampos,
        "incluirLimiteDeCredito": incluirLimiteDeCredito,
        "deuda": deuda,
        "saldo": saldo,
        "creditos": creditos,
      };

  @override
  List<Object?> get props => [
        idPersona,
        nombre,
        apellido,
        email,
        telefono,
        seguroMedico,
        seguroMedicoNumero,
        ruc,
        cedula,
        tipoPersona,
        usuarioLogin,
        idLocalDefecto,
        flagVendedor,
        flagTaxfree,
        flagExcepcionChequeoVenta,
        observacion,
        direccion,
        idCiudad,
        tipoCliente,
        fechaHoraAprobContrato,
        soloUsuariosDelSistema,
        soloPersonasTaxfree,
        nombreCompleto,
        limiteCredito,
        fechaNacimiento,
        soloProximosCumpleanhos,
        todosLosCampos,
        incluirLimiteDeCredito,
        deuda,
        saldo,
        creditos,
      ];
}
