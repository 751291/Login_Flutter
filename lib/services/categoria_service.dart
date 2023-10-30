import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:login/models/categorias.dart';

class CategoriaService extends ChangeNotifier {
  final String _baseUrl = '143.198.118.203:8000';
  final String _user = 'test';
  final String _pass = 'test2023';

  List<ListadoCategoria> categoria = [];
  ListadoCategoria? SelectProduct;
  bool isLoading = true;
  bool isEditCreate = true;

  CategoriaService() {
    loadCategoria();
  }
  Future loadCategoria() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_list_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.get(url, headers: {'authorization': basicAuth});
    final categoriaMap = Categorias.fromJson(response.body);
    print(response.body);
    categoria = categoriaMap.listadocategoria;
    isLoading = false;
    notifyListeners();
  }

  Future editarOCreateCategoria(ListadoCategoria categoria) async {
    isEditCreate = true;
    notifyListeners();
    if (categoria.category_id == 0) {
      await this.createCategoria(categoria);
    } else {
      await this.updateCategoria(categoria);
    }

    isEditCreate = false;
    notifyListeners();
  }

  Future<String> updateCategoria(ListadoCategoria product) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_edit_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: product.toJson(), headers: {
      'authorization': basicAuth,
      'Content-Type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);

    //actualizamos el listado
    final index = categoria
        .indexWhere((element) => element.category_id == product.category_id);
    categoria[index] = product;

    return '';
  }

  Future createCategoria(ListadoCategoria categoria) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_add_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: categoria.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.categoria.add(categoria);
    return '';
  }

  Future deleteProduct(ListadoCategoria categoria, BuildContext context) async {
    final url = Uri.http(
      _baseUrl,
      'ejemplos/category_del_rest/',
    );
    String basicAuth = 'Basic ' + base64Encode(utf8.encode('$_user:$_pass'));
    final response = await http.post(url, body: categoria.toJson(), headers: {
      'authorization': basicAuth,
      'Content-type': 'application/json; charset=UTF-8',
    });
    final decodeResp = response.body;
    print(decodeResp);
    this.categoria.clear(); //borra todo el listado
    loadCategoria();
    Navigator.of(context).pushNamed('list');
    return '';
  }
}
