import 'package:dio/dio.dart';
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
}
