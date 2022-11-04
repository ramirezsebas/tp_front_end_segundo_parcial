import 'package:dio/dio.dart';
import 'package:tp_front_end_segundo_parcial/models/tipo_producto_model.dart';

class TipoProductoService {
  Dio dio = Dio();

  Future<List<TipoProductoModel>> getTipoProductos() async {
    String url = "https://equipoyosh.com/stock-nutrinatalia/tipoProducto";

    final resp = await dio.get(url);

    if (resp.statusCode == 200) {
      return List.from(resp.data['lista'])
          .map((e) => TipoProductoModel.fromJson(e))
          .toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
