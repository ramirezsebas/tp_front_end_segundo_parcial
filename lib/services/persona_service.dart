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
      throw ServerException(message: 'Failed to load data');
    }
  }
}
