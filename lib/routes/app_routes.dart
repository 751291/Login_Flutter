import 'package:flutter/material.dart';
import 'package:login/screen/boton_screen.dart';
import 'package:login/screen/edit_categoria_screen.dart';
import 'package:login/screen/edit_product_screen.dart';
import 'package:login/screen/edit_proveedor_screen.dart';
import 'package:login/screen/error_screen.dart';
import 'package:login/screen/login_screen.dart';
import 'package:login/screen/screen_main.dart';
import 'package:login/screen/register_user_screen.dart';

class AppRoutes {
  static const initialRoute = 'login';
  static Map<String, Widget Function(BuildContext)> routes = {
    'login': (BuildContext context) => const LoginScreen(),
    'list': (BuildContext context) => const BotonScreen(),
    'edit': (BuildContext context) => const EditProductScreen(),
    'add_user': (BuildContext context) => const RegisterUserScreen(),
    'edit_categoria': (BuildContext context) => const EditCategoriaScreen(),
    'edit_proveedor': (BuildContext context) => const EditProveedortScreen(),
    'main': (BuildContext context) => const Screen_Main(),
  };

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}
