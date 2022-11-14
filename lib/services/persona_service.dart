import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:tp_front_end_segundo_parcial/core/errors/server_exception.dart';
import 'package:tp_front_end_segundo_parcial/models/persona_model.dart';

class PersonaService {
  Dio dio = Dio();

  Future<List<PersonaModel>> getPersonas() async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/persona";

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      final respData = List.from(resp.data['lista']);
      final personas = respData.map((e) => PersonaModel.fromJson(e)).toList();
      return personas;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<List<PersonaModel>> getPersonasDelSistema() async {
    String uri =
        'https://equipoyosh.com/stock-nutrinatalia/persona?ejemplo={"soloUsuariosDelSistema":true}';
    final url = Uri.encodeFull(uri);

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      final respData = List.from(resp.data['lista']);
      final personas = respData.map((e) => PersonaModel.fromJson(e)).toList();
      return personas;
    } else {
      throw ServerException(message: 'No se pudo obtener los datos');
    }
  }

  Future<String> createPersona(PersonaModel persona) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/persona";

    if (kDebugMode) {
      print(persona.toJson());
    }

    try {
      final resp = await dio.post(url,
          data: persona.toJson(),
          options: Options(
              followRedirects: false,
              validateStatus: (status) {
                if (status != null && (status ~/ 100) == 2) {
                  return true;
                } else {
                  return false;
                }
              }));
      if (resp.statusCode != null && (resp.statusCode! ~/ 100) == 2) {
        return "Persona creada correctamente!";
      } else {
        return "No se pudo crear la persona";
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return "Error al crear la persona";
    }
  }

  Future<String> updatePersona(PersonaModel persona) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/persona";

    final resp = await dio.put(url, data: persona.toJson());

    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> deletePersona(int id) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/persona/$id";

    final resp = await dio.delete(url);

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }
}
