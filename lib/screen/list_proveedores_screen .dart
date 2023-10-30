import 'package:flutter/material.dart';
import 'package:login/models/proveedores.dart';
import 'package:login/screen/loading_screen.dart';
import 'package:login/services/proveedores_service.dart';
import 'package:login/widgets/Proveedor_card.dart';
import 'package:provider/provider.dart';

class ListProveedorScreen extends StatelessWidget {
  const ListProveedorScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService =
        Provider.of<ProveedorService>(context, listen: true);
    if (proveedorService.isLoading) return LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de los proveedores'),
      ),
      body: ListView.builder(
        itemCount: proveedorService.proveedores.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            proveedorService.SelectProveedor =
                proveedorService.proveedores[index].copy();
            Navigator.pushNamed(context, 'edit_proveedor');
          },
          child: ProvedorCard(proveedores: proveedorService.proveedores[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          proveedorService.SelectProveedor = ListadoProveedores(
              proveedorId: 0,
              proveedorName: '',
              proveedorLastName: '',
              proveedorMail: '',
              proveedorState: 'Activa');
          Navigator.pushNamed(context, 'edit_proveedor');
        },
      ),
    );
  }
}
