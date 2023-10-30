import 'package:flutter/material.dart';
import 'package:login/providers/categoria_form_provider.dart';
import 'package:login/services/categoria_service.dart';
import 'package:provider/provider.dart';
import '../ui/input_decorations.dart';

class EditCategoriaScreen extends StatelessWidget {
  const EditCategoriaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categoriaService = Provider.of<CategoriaService>(context);
    return ChangeNotifierProvider(
      create: (_) => CategoriaFormProvider(categoriaService.SelectProduct!),
      child: CategoriaScreenBody(
        categoriaService: categoriaService,
      ),
    );
  }
}

class CategoriaScreenBody extends StatelessWidget {
  const CategoriaScreenBody({
    Key? key,
    required this.categoriaService,
  }) : super(key: key);

  final CategoriaService categoriaService;
  @override
  Widget build(BuildContext context) {
    final categoriaForm = Provider.of<CategoriaFormProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Categorias"),
        elevation: 1,
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          _CategoriaForm(),
        ]),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: const Icon(Icons.delete_forever),
            onPressed: () async {
              if (!categoriaForm.isValidForm()) return;
              await categoriaService.deleteProduct(
                  categoriaForm.categoria, context);
            },
            heroTag: null,
          ),
          const SizedBox(width: 20),
          FloatingActionButton(
            child: const Icon(Icons.save),
            onPressed: () async {
              if (!categoriaForm.isValidForm()) return;
              await categoriaService
                ..editarOCreateCategoria(categoriaForm.categoria);
            },
            heroTag: null,
          ),
        ],
      ),
    );
  }
}

class _CategoriaForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final categoriaForm = Provider.of<CategoriaFormProvider>(context);
    final categoria = categoriaForm.categoria;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        decoration: _createDecoration(),
        child: Form(
          key: categoriaForm.formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              TextFormField(
                initialValue: categoria.category_name,
                onChanged: (value) => categoria.category_name = value,
                validator: (value) {
                  if (value == null || value.length < 1)
                    return 'el nombre es obligatorio';
                },
                decoration: InputDecortions.authInputDecoration(
                  hinText: 'Nombre de la Categoria',
                  labelText: 'Nombre',
                ),
              ),
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
