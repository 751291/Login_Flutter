import 'package:flutter/material.dart';
import 'package:login/screen/list_categorias_screen%20.dart';
import 'package:login/screen/list_proveedores_screen%20.dart';
import 'package:login/screen/screen.dart';
import 'package:login/services/proveedores_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<ProveedorService>(
          create: (context) => ProveedorService(),
        ),
        // Agrega otros providers aquí si es necesario.
      ],
      child: MaterialApp(
        home: Screen_Main(),
      ),
    ),
  );
}

class Screen_Main extends StatefulWidget {
  const Screen_Main({Key? key}); // Cambiado 'super' a 'Key?'
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Screen_Main> {
  String _selectedValue = '1';
  int _pageIndex = 0;
  List<Widget> _pages = [
    ListProveedorScreen(),
    ListCategoriasScreen(),
    ListProductScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Online'),
        elevation: 1,
        actions: [
          PopupMenuButton<String>(
            onSelected: (String value) {
              setState(() {
                _selectedValue = value;
                _pageIndex = int.parse(value) - 1; //
              });
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem(
                value: '1',
                child: Text('Proveedores'),
              ),
              PopupMenuItem(
                value: '2',
                child: Text('Categorías'),
              ),
              PopupMenuItem(
                value: '3',
                child: Text('Productos'),
              ),
            ],
          )
        ],
      ),
      body: _pages[_pageIndex],
    );
  }
}
