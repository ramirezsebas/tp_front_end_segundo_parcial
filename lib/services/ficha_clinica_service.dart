import 'package:dio/dio.dart';
import 'package:tp_front_end_segundo_parcial/models/ficha_clinica_dto.dart';
import 'package:tp_front_end_segundo_parcial/models/ficha_clinica_model.dart';

import '../core/errors/server_exception.dart';

class FichaClinicaService {
  Dio dio = Dio();

  Future<List<FichaClinicaModel>> getFichasClinicas() async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/fichaClinica";

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      final respData = List.from(resp.data['lista']);
      final fichasClinicas =
          respData.map((e) => FichaClinicaModel.fromJson(e)).toList();
      return fichasClinicas;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> deleteFichaClinica(int id) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/fichaClinica/$id";

    final resp = await dio.delete(url);

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> updateFichaClinica(FichaClinicaModel fichaClinica) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/fichaClinica";

    final resp = await dio.put(url, data: fichaClinica.toJson());

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> createFichaClinica(FichaClinicaDto fichaClinica) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/fichaClinica";

    final resp = await dio.post(url, data: fichaClinica.toJson());

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }
}
