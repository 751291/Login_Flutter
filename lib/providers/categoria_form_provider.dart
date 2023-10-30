import 'package:flutter/material.dart';
import 'package:login/models/categorias.dart';

class CategoriaFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  ListadoCategoria categoria;
  CategoriaFormProvider(this.categoria);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
