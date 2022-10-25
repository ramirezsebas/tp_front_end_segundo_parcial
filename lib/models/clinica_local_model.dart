class ClinicaLocalModel {
  ClinicaLocalModel({
    required this.idLocal,
    required this.nombre,
    required this.flagCasaCentral,
    required this.cantidadIngreso,
    required this.anhoMesActual,
    required this.fechaHoraUltimoIngreso,
    required this.minutosSesion,
    required this.nombreEmpresa,
    required this.urlImagen,
    required this.secuencia,
    required this.pin,
    required this.appMovil,
    required this.qr,
    required this.qrSoloEvaluacion,
    required this.moneda,
    required this.evaluacionLocal,
    required this.evaluacionItem,
    required this.habilitarDatosManualmente,
    required this.habilitarFacebook,
    required this.mostrarPreciosEnAccesoPublico,
    required this.habilitarAnonimo,
    required this.habilitarPedidosEnLocal,
    required this.habilitarReserva,
    required this.habilitarPedidosDelivery,
    required this.habilitarPedidosParaLlevar,
    required this.textoLamarAlMozo,
    required this.habilitarLlamarAlMozo,
    required this.recurso,
    required this.textoRealizarPedido,
    required this.solicitarRucEnPedidos,
    required this.flagRequiereAutorizacion,
    required this.radioCoberturaDelivery,
    required this.costoDelivery,
    required this.posicionMapa,
    required this.tiempoEntregaDelivery,
    required this.horaCierre,
    required this.horaApertura,
    required this.ultimaPublicacionShowMoreWeb,
    required this.horariosEntregas,
  });

  final int? idLocal;
  final String? nombre;
  final String? flagCasaCentral;
  final int? cantidadIngreso;
  final String? anhoMesActual;
  final DateTime? fechaHoraUltimoIngreso;
  final int? minutosSesion;
  final dynamic nombreEmpresa;
  final dynamic urlImagen;
  final dynamic secuencia;
  final dynamic pin;
  final dynamic appMovil;
  final dynamic qr;
  final dynamic qrSoloEvaluacion;
  final dynamic moneda;
  final dynamic evaluacionLocal;
  final dynamic evaluacionItem;
  final dynamic habilitarDatosManualmente;
  final dynamic habilitarFacebook;
  final dynamic mostrarPreciosEnAccesoPublico;
  final dynamic habilitarAnonimo;
  final dynamic habilitarPedidosEnLocal;
  final dynamic habilitarReserva;
  final dynamic habilitarPedidosDelivery;
  final dynamic habilitarPedidosParaLlevar;
  final dynamic textoLamarAlMozo;
  final dynamic habilitarLlamarAlMozo;
  final dynamic recurso;
  final dynamic textoRealizarPedido;
  final dynamic solicitarRucEnPedidos;
  final dynamic flagRequiereAutorizacion;
  final dynamic radioCoberturaDelivery;
  final dynamic costoDelivery;
  final dynamic posicionMapa;
  final dynamic tiempoEntregaDelivery;
  final dynamic horaCierre;
  final dynamic horaApertura;
  final dynamic ultimaPublicacionShowMoreWeb;
  final dynamic horariosEntregas;

  factory ClinicaLocalModel.fromJson(Map<String, dynamic> json) => ClinicaLocalModel(
        idLocal: json["idLocal"],
        nombre: json["nombre"],
        flagCasaCentral: json["flagCasaCentral"],
        cantidadIngreso: json["cantidadIngreso"],
        anhoMesActual: json["anhoMesActual"],
        fechaHoraUltimoIngreso: json["fechaHoraUltimoIngreso"] == null
            ? null
            : DateTime.parse(json["fechaHoraUltimoIngreso"]),
        minutosSesion: json["minutosSesion"],
        nombreEmpresa: json["nombreEmpresa"],
        urlImagen: json["urlImagen"],
        secuencia: json["secuencia"],
        pin: json["pin"],
        appMovil: json["appMovil"],
        qr: json["qr"],
        qrSoloEvaluacion: json["qrSoloEvaluacion"],
        moneda: json["moneda"],
        evaluacionLocal: json["evaluacionLocal"],
        evaluacionItem: json["evaluacionItem"],
        habilitarDatosManualmente: json["habilitarDatosManualmente"],
        habilitarFacebook: json["habilitarFacebook"],
        mostrarPreciosEnAccesoPublico: json["mostrarPreciosEnAccesoPublico"],
        habilitarAnonimo: json["habilitarAnonimo"],
        habilitarPedidosEnLocal: json["habilitarPedidosEnLocal"],
        habilitarReserva: json["habilitarReserva"],
        habilitarPedidosDelivery: json["habilitarPedidosDelivery"],
        habilitarPedidosParaLlevar: json["habilitarPedidosParaLlevar"],
        textoLamarAlMozo: json["textoLamarAlMozo"],
        habilitarLlamarAlMozo: json["habilitarLlamarAlMozo"],
        recurso: json["recurso"],
        textoRealizarPedido: json["textoRealizarPedido"],
        solicitarRucEnPedidos: json["solicitarRucEnPedidos"],
        flagRequiereAutorizacion: json["flagRequiereAutorizacion"],
        radioCoberturaDelivery: json["radioCoberturaDelivery"],
        costoDelivery: json["costoDelivery"],
        posicionMapa: json["posicionMapa"],
        tiempoEntregaDelivery: json["tiempoEntregaDelivery"],
        horaCierre: json["horaCierre"],
        horaApertura: json["horaApertura"],
        ultimaPublicacionShowMoreWeb: json["ultimaPublicacionShowMoreWeb"],
        horariosEntregas: json["horariosEntregas"],
      );

  Map<String, dynamic> toJson() => {
        "idLocal": idLocal,
        "nombre": nombre,
        "flagCasaCentral": flagCasaCentral,
        "cantidadIngreso": cantidadIngreso,
        "anhoMesActual": anhoMesActual,
        "fechaHoraUltimoIngreso": fechaHoraUltimoIngreso == null
            ? null
            : fechaHoraUltimoIngreso!.toIso8601String(),
        "minutosSesion": minutosSesion,
        "nombreEmpresa": nombreEmpresa,
        "urlImagen": urlImagen,
        "secuencia": secuencia,
        "pin": pin,
        "appMovil": appMovil,
        "qr": qr,
        "qrSoloEvaluacion": qrSoloEvaluacion,
        "moneda": moneda,
        "evaluacionLocal": evaluacionLocal,
        "evaluacionItem": evaluacionItem,
        "habilitarDatosManualmente": habilitarDatosManualmente,
        "habilitarFacebook": habilitarFacebook,
        "mostrarPreciosEnAccesoPublico": mostrarPreciosEnAccesoPublico,
        "habilitarAnonimo": habilitarAnonimo,
        "habilitarPedidosEnLocal": habilitarPedidosEnLocal,
        "habilitarReserva": habilitarReserva,
        "habilitarPedidosDelivery": habilitarPedidosDelivery,
        "habilitarPedidosParaLlevar": habilitarPedidosParaLlevar,
        "textoLamarAlMozo": textoLamarAlMozo,
        "habilitarLlamarAlMozo": habilitarLlamarAlMozo,
        "recurso": recurso,
        "textoRealizarPedido": textoRealizarPedido,
        "solicitarRucEnPedidos": solicitarRucEnPedidos,
        "flagRequiereAutorizacion": flagRequiereAutorizacion,
        "radioCoberturaDelivery": radioCoberturaDelivery,
        "costoDelivery": costoDelivery,
        "posicionMapa": posicionMapa,
        "tiempoEntregaDelivery": tiempoEntregaDelivery,
        "horaCierre": horaCierre,
        "horaApertura": horaApertura,
        "ultimaPublicacionShowMoreWeb": ultimaPublicacionShowMoreWeb,
        "horariosEntregas": horariosEntregas,
      };
}
