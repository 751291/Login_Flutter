import 'package:flutter/material.dart';
import 'package:login/providers/provedores_form_provider.dart';
import 'package:login/services/proveedores_service.dart';
import 'package:login/widgets/proveedor_image.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditProveedortScreen extends StatelessWidget {
  const EditProveedortScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final proveedorService = Provider.of<ProveedorService>(context);
    return ChangeNotifierProvider(
        create: (_) =>
            ProveedoresFormProvider(proveedorService.SelectProveedor!),
        child: ProveedorScreenBody(
          proveedorService: proveedorService,
        ));
  }
}

class ProveedorScreenBody extends StatelessWidget {
  const ProveedorScreenBody({
    Key? key,
    required this.proveedorService,
  }) : super(key: key);

  final ProveedorService proveedorService;
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedoresFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Proveedores"),
        elevation: 1,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _ProveedoresForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService.deleteProveedor(
                  proveedorForm.listadoprovedores, context);
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () async {
              if (!proveedorForm.isValidForm()) return;
              await proveedorService
                  .editOrCreateProveedor(proveedorForm.listadoprovedores);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class _ProveedoresForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final proveedorForm = Provider.of<ProveedoresFormProvider>(context);
    final proveedor = proveedorForm.listadoprovedores;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: proveedorForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: proveedor.proveedorName,
                onChanged: (value) => proveedor.proveedorName = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el nombre es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre del producto',
                  labelText: 'Nombre',
                ),
              ),
              /*
              const SizedBox(height: 20),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: proveedor.productPrice.toString(),
                onChanged: (value) {
                  if (int.tryParse(value) == null) {
                    proveedor.productPrice = 0;
                  } else {
                    proveedor.productPrice = int.parse(value);
                  }
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: '-----',
                  labelText: 'Precio',
                ),
              ),*/
              const SizedBox(height: 20),
              SwitchListTile.adaptive(
                value: true,
                onChanged: (value) {},
                activeColor: Colors.blueAccent,
                title: const Text('Disponible'),
              )
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _createDecoration() => const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Colors.black,
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}
