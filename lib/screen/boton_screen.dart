import 'package:login/screen/list_Categorias_screen%20.dart';
import 'package:login/screen/list_proveedores_screen%20.dart';
import 'package:login/screen/list_product_screen.dart';
import 'package:login/theme/theme.dart';
import 'package:flutter/material.dart';

class BotonScreen extends StatelessWidget {
  const BotonScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Catedra de Desarrollo Móvil'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProductScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 206,
                    0), // Usa el color del tema como fondo del botón
              ),
              child: Text(
                'Listar Productos',
                style: TextStyle(
                  color: Colors.white, // Configura el color de texto
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListCategoriasScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 206,
                    0), // Usa el color del tema como fondo del botón
              ),
              child: Text(
                'Listar Categorías',
                style: TextStyle(
                  color: Colors.white, // Configura el color de texto
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ListProveedorScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 91, 206,
                    0), // Usa el color del tema como fondo del botón
              ),
              child: Text(
                'Listar Proveedores',
                style: TextStyle(
                  color: Colors.white, // Configura el color de texto
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
