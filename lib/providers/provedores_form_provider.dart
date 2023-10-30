import 'package:flutter/material.dart';
import 'package:login/models/proveedores.dart';

class ProveedoresFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  ListadoProveedores listadoprovedores;
  ProveedoresFormProvider(this.listadoprovedores);

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}
