// To parse this JSON data, do
//
//     final personaModel = personaModelFromJson(jsonString);

import 'dart:convert';

PersonaModel personaModelFromJson(String str) =>
    PersonaModel.fromJson(json.decode(str));

String personaModelToJson(PersonaModel data) => json.encode(data.toJson());

class PersonaModel {
  PersonaModel({
    required this.idPersona,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.ruc,
    required this.cedula,
    required this.tipoPersona,
    required this.fechaNacimiento,
  });

  PersonaModel.defaultConst() {
    nombre = "";
    apellido = "";
    email = "";
    telefono = "";
    ruc = "";
    cedula = "";
    tipoPersona = "";
    cedula = "";
    fechaNacimiento = DateTime.now();
  }

  int? idPersona;
  String? nombre;
  String? apellido;
  String? email;
  String? telefono;
  String? ruc;
  String? cedula;
  String? tipoPersona;
  DateTime? fechaNacimiento;

  factory PersonaModel.fromJson(Map<String, dynamic> json) => PersonaModel(
        idPersona: json["idPersona"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        email: json["email"],
        telefono: json["telefono"],
        ruc: json["ruc"],
        cedula: json["cedula"],
        tipoPersona: json["tipoPersona"],
        fechaNacimiento: json["fechaNacimiento"] == null
            ? null
            : DateTime.parse(json["fechaNacimiento"]),
      );

  Map<String, dynamic> toJson() => {
        "idPersona": idPersona,
        "nombre": nombre,
        "apellido": apellido,
        "email": email,
        "telefono": telefono,
        "ruc": ruc,
        "cedula": cedula,
        "tipoPersona": tipoPersona,
        "fechaNacimiento": fechaNacimiento == null
            ? null
            : "${fechaNacimiento!.year.toString().padLeft(4, '0')}-${fechaNacimiento!.month.toString().padLeft(2, '0')}-${fechaNacimiento!.day.toString().padLeft(2, '0')} 00:00:00",
      };

  @override
  List<Object?> get props => [
        idPersona,
        nombre,
        apellido,
        email,
        telefono,
        ruc,
        cedula,
        tipoPersona,
        fechaNacimiento,
      ];
}
