// To parse this JSON data, do
//
//     final reservaDto = reservaDtoFromJson(jsonString);

import 'dart:convert';

ReservaDto reservaDtoFromJson(String str) =>
    ReservaDto.fromJson(json.decode(str));

String reservaDtoToJson(ReservaDto data) => json.encode(data.toJson());

class ReservaDto {
  ReservaDto({
    this.idEmpleado,
    this.idCliente,
    this.fechaDesdeCadena,
    this.fechaHastaCadena,
  });

  String? idEmpleado;
  String? idCliente;
  String? fechaDesdeCadena;
  String? fechaHastaCadena;

  factory ReservaDto.fromJson(Map<String, dynamic> json) => ReservaDto(
        idEmpleado: json["idEmpleado"],
        idCliente: json["idCliente"],
        fechaDesdeCadena: json["fechaDesdeCadena"],
        fechaHastaCadena: json["fechaHastaCadena"],
      );

  Map<String, dynamic> toJson() {
    Map<String, dynamic> map={};
    if(idEmpleado!=null){
      map ["idEmpleado"]={"idPersona": idEmpleado};
    }
    if(idCliente!=null){
      map ["idCliente"]={"idPersona": idCliente};
    }
    if(fechaDesdeCadena!=null){
      map ["fechaDesdeCadena"]=fechaDesdeCadena;
    }
    if(fechaHastaCadena!=null){
      map ["fechaHastaCadena"]=fechaHastaCadena;
    }
    return map;
  }
}
