import 'dart:convert';

class Categorias {
  Categorias({
    required this.listadocategoria,
  });

  List<ListadoCategoria> listadocategoria;

  factory Categorias.fromJson(String str) =>
      Categorias.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Categorias.fromMap(Map<String, dynamic> json) => Categorias(
        listadocategoria: List<ListadoCategoria>.from(
            json["Listado Categorias"].map((x) => ListadoCategoria.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Listado Categorias":
            List<dynamic>.from(listadocategoria.map((x) => x.toMap())),
      };
}

class ListadoCategoria {
  ListadoCategoria({
    required this.category_id,
    required this.category_name,
    required this.category_state,
  });

  int category_id;
  String category_name;
  String category_state;

  factory ListadoCategoria.fromJson(String str) =>
      ListadoCategoria.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoCategoria.fromMap(Map<String, dynamic> json) =>
      ListadoCategoria(
        category_id: json["category_id"],
        category_name: json["category_name"],
        category_state: json["category_state"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": category_id,
        "category_name": category_name,
        "category_state": category_state,
      };

  ListadoCategoria copy() => ListadoCategoria(
      category_id: category_id,
      category_name: category_name,
      category_state: category_state);
}
