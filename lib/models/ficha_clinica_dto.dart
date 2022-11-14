class FichaClinicaDto {
  final String motivoConsulta;
  final String diagnostico;
  final String observacion;
  final String idEmpleado;
  final String idCliente;
  final String idTipoProducto;

  FichaClinicaDto({
    required this.motivoConsulta,
    required this.diagnostico,
    required this.observacion,
    required this.idEmpleado,
    required this.idCliente,
    required this.idTipoProducto,
  });

  factory FichaClinicaDto.fromJson(Map<String, dynamic> json) =>
      FichaClinicaDto(
        motivoConsulta: json["motivoConsulta"],
        diagnostico: json["diagnostico"],
        observacion: json["observacion"],
        idEmpleado: json["idEmpleado"],
        idCliente: json["idCliente"],
        idTipoProducto: json["idTipoProducto"],
      );

  Map<String, dynamic> toJson() => {
        "motivoConsulta": motivoConsulta,
        "diagnostico": diagnostico,
        "observacion": observacion,
        "idEmpleado": {
          "idPersona": idEmpleado,
        },
        "idCliente": {
          "idPersona": idCliente,
        },
        "idTipoProducto": {
          "idTipoProducto": idTipoProducto,
        },
      };
  Map<String, dynamic> toJson2(String id) => {
        "idFichaClinica": id,
        "motivoConsulta": motivoConsulta,
        "diagnostico": diagnostico,
        "observacion": observacion,
        "idEmpleado": {
          "idPersona": idEmpleado,
        },
        "idCliente": {
          "idPersona": idCliente,
        },
        "idTipoProducto": {
          "idTipoProducto": idTipoProducto,
        },
      };
}
