class CategoriaModel {
  CategoriaModel({
    required this.idCategoria,
    required this.descripcion,
    required this.flagVisible,
    required this.posicion,
  });

  final int? idCategoria;
  final String? descripcion;
  final String? flagVisible;
  final int? posicion;

  factory CategoriaModel.fromJson(Map<String, dynamic> json) => CategoriaModel(
        idCategoria: json["idCategoria"],
        descripcion: json["descripcion"],
        flagVisible: json["flagVisible"],
        posicion: json["posicion"],
      );

  Map<String, dynamic> toJson() => {
        "idCategoria": idCategoria,
        "descripcion": descripcion,
        "flagVisible": flagVisible,
        "posicion": posicion,
      };
}
