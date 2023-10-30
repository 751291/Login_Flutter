import 'package:login/screen/list_categorias_screen%20.dart';
import 'package:login/screen/list_proveedores_screen%20.dart';
import 'package:login/screen/list_product_screen.dart';
import 'package:login/theme/theme.dart';

class ContainerButton {
  const ContainerButton({required EdgeInsets margin});
}

@override
Widget build(BuildContext context) {
  return Container(
    margin: const EdgeInsets.only(top: 15),
    decoration: const BoxDecoration(color: Color.fromARGB(66, 122, 121, 119)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListProductScreen()));
          },
          child: const Text(
            'PRODUCTOS',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListProveedorScreen()));
          },
          child: const Text(
            'PROVEEDORES',
            style: TextStyle(fontSize: 10),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ListCategoriasScreen()));
          },
          child: const Text(
            ' CATEGORIAS',
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
    ),
  );
}
