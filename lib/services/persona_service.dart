import 'package:dio/dio.dart';
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

    final resp = await dio.post(url, data: persona.toJson());

    if (resp.statusCode == 200) {
      return resp.data;
    } else {
      throw ServerException(message: 'Failed to load data');
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
}
