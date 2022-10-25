import 'categoria_model.dart';

class TipoProductoModel {
  TipoProductoModel({
    required this.idTipoProducto,
    required this.descripcion,
    required this.flagVisible,
    required this.idCategoria,
    required this.posicion,
  });

  final int? idTipoProducto;
  final String? descripcion;
  final String? flagVisible;
  final CategoriaModel? idCategoria;
  final int? posicion;

  factory TipoProductoModel.fromJson(Map<String, dynamic> json) => TipoProductoModel(
        idTipoProducto: json["idTipoProducto"],
        descripcion: json["descripcion"],
        flagVisible: json["flagVisible"],
        idCategoria: json["idCategoria"] == null
            ? null
            : CategoriaModel.fromJson(json["idCategoria"]),
        posicion: json["posicion"],
      );

  Map<String, dynamic> toJson() => {
        "idTipoProducto": idTipoProducto,
        "descripcion": descripcion,
        "flagVisible": flagVisible,
        "idCategoria": idCategoria == null ? null : idCategoria!.toJson(),
        "posicion": posicion,
      };
}
