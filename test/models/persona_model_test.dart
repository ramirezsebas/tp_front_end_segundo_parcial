import 'package:flutter_test/flutter_test.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';

void main() {
  final jsonTest = {
    "idPersona": 279,
    "nombre": "piru57",
    "apellido": "141414",
    "email": "Prueba@gmaill.comm",
    "telefono": "09981621",
    "seguroMedico": null,
    "seguroMedicoNumero": null,
    "ruc": "117380",
    "cedula": "777777",
    "tipoPersona": "FISICA",
    "usuarioLogin": null,
    "idLocalDefecto": null,
    "flagVendedor": "N",
    "flagTaxfree": null,
    "flagExcepcionChequeoVenta": "N",
    "observacion": null,
    "direccion": null,
    "idCiudad": null,
    "tipoCliente": "MINORISTA",
    "fechaHoraAprobContrato": null,
    "soloUsuariosDelSistema": null,
    "soloPersonasTaxfree": null,
    "nombreCompleto": "piru57 141414",
    "limiteCredito": -1,
    "fechaNacimiento": "1991-01-01",
    "soloProximosCumpleanhos": null,
    "todosLosCampos": null,
    "incluirLimiteDeCredito": null,
    "deuda": null,
    "saldo": null,
    "creditos": null
  };
  test('persona model from json', () async {
    final persona = PersonaModel.fromJson(jsonTest);
    expect(persona, isA<PersonaModel>());
  });

  test('persona model to json', () async {
    final persona = PersonaModel.fromJson(jsonTest);
    final json = persona.toJson();
    expect(json, isA<Map<String, dynamic>>());
  });
  
  test('persona model to json implementacon', () async {
    final persona = PersonaModel.fromJson(jsonTest);
    final json = persona.toJson();
    expect(json, jsonTest);
  });
}
