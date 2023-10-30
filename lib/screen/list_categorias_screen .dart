import 'package:flutter/material.dart';
import 'package:login/models/categorias.dart';
import 'package:login/screen/loading_screen.dart';
import 'package:login/services/categoria_service.dart';
import 'package:login/widgets/categoria_card.dart';
import 'package:provider/provider.dart';

class ListCategoriasScreen extends StatelessWidget {
  const ListCategoriasScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final listarCategoria = Provider.of<CategoriaService>(context);
    if (listarCategoria.isLoading) return const LoadingScreen();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de las Categorías'),
      ),
      body: ListView.builder(
        itemCount: listarCategoria.categoria.length,
        itemBuilder: (BuildContext context, index) => GestureDetector(
          onTap: () {
            listarCategoria.SelectProduct =
                listarCategoria.categoria[index].copy();
            Navigator.pushNamed(context, 'edit');
          },
          child: CategoriaCard(categoria: listarCategoria.categoria[index]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          listarCategoria.SelectProduct = ListadoCategoria(
              category_id: 0, category_name: '', category_state: '');
          Navigator.pushNamed(context, 'edit_categoria');
        },
      ),
    );
  }
}
