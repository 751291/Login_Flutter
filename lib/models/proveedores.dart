import 'dart:convert';

class Proveedor {
  Proveedor({
    required this.listadoprovedores,
  });

  List<ListadoProveedores> listadoprovedores;

  factory Proveedor.fromJson(String str) => Proveedor.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Proveedor.fromMap(Map<String, dynamic> json) => Proveedor(
        listadoprovedores: List<ListadoProveedores>.from(
            json["Proveedores Listado"]
                .map((x) => ListadoProveedores.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Proveedores Listado":
            List<dynamic>.from(listadoprovedores.map((x) => x.toMap())),
      };
}

class ListadoProveedores {
  ListadoProveedores({
    required this.proveedorId,
    required this.proveedorName,
    required this.proveedorLastName,
    required this.proveedorMail,
    required this.proveedorState,
  });

  int proveedorId;
  String proveedorName;
  String proveedorLastName;
  String proveedorMail;
  String proveedorState;

  factory ListadoProveedores.fromJson(String str) =>
      ListadoProveedores.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ListadoProveedores.fromMap(Map<String, dynamic> json) =>
      ListadoProveedores(
        proveedorId: json["providerid"],
        proveedorName: json["provider_name"],
        proveedorLastName: json["provider_last_name"],
        proveedorMail: json["provider_mail"],
        proveedorState: json["provider_state"],
      );

  Map<String, dynamic> toMap() => {
        "providerid": proveedorId,
        "provider_name": proveedorName,
        "provider_last_name": proveedorLastName,
        "provider_mail": proveedorMail,
        "provider_state": proveedorState,
      };

  ListadoProveedores copy() => ListadoProveedores(
      proveedorId: proveedorId,
      proveedorName: proveedorName,
      proveedorLastName: proveedorLastName,
      proveedorMail: proveedorMail,
      proveedorState: proveedorState);
}
