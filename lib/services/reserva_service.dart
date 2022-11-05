import 'package:dio/dio.dart';
import 'package:tp_front_end_segundo_parcial/models/reserva_model.dart';

import '../core/errors/server_exception.dart';

class ReservaService {
  Dio dio = Dio();

  Future<List<ReservaModel>> getReservas() async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/reserva";

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      final respData = List.from(resp.data['lista']);
      final reservas =
          respData.map((e) => ReservaModel.fromJson(e)).toList();
      return reservas;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<List<ReservaModel>> getAgenda(num? id, String fecha) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/persona/$id/agenda?fecha=$fecha";

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      final respData = List.from(resp.data);
      final reservas =
      respData.map((e) => ReservaModel.fromJson(e)).toList();
      return reservas;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> deleteReserva(int id) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/reserva/$id";

    final resp = await dio.delete(url);

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }

  Future<bool> updateReserva(ReservaModel reserva) async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/reserva";

    final resp = await dio.put(url, data: reserva.toJson());

    if (resp.statusCode == 200) {
      return true;
    } else {
      throw ServerException(message: 'Failed to load data');
    }
  }
}
