import 'dart:io'; // Para manejar la entrada desde la consola

// Clase para representar un Producto
class Producto {
  String nombre;
  double precio;
  int cantidad;
  int stock;
  String categoria;

  // Constructor de la clase Producto
  Producto(this.nombre, this.precio, this.cantidad, this.stock, this.categoria);

  // Método para mostrar información del producto
  void mostrarProducto() {
    print("Nombre: $nombre");
    print("Precio: \$${precio.toStringAsFixed(2)}");
    print("Cantidad: $cantidad");
    print("Stock: $stock");
    print("Categoría: $categoria");
    print("------------------------");
  }
}

// Lista de productos (simulando un inventario)
List<Producto> inventario = [
  Producto('Laptop', 1000, 5, 10, 'Electrónica'),
  Producto('Camiseta', 20, 50, 100, 'Ropa'),
  Producto('Smartphone', 800, 3, 7, 'Electrónica'),
  Producto('Zapatos', 50, 30, 60, 'Ropa'),
];

// Función para buscar productos por nombre o categoría
void buscarProducto() {
  print('¿Desea buscar por nombre o categoría?');
  String? criterio = stdin.readLineSync();

  print('Ingrese el nombre2 de búsqueda:');
  String? valorBusqueda = stdin.readLineSync();

  if (criterio != null && valorBusqueda != null) {
    List<Producto> resultados = [];

    if (criterio.toLowerCase() == 'nombre') {
      // Buscar productos por nombre
      resultados = inventario
          .where((producto) => producto.nombre
              .toLowerCase()
              .contains(valorBusqueda.toLowerCase()))
          .toList();
    } else if (criterio.toLowerCase() == 'categoría') {
      // Buscar productos por categoría
      resultados = inventario
          .where((producto) => producto.categoria
              .toLowerCase()
              .contains(valorBusqueda.toLowerCase()))
          .toList();
    }

    // Mostrar los resultados
    if (resultados.isNotEmpty) {
      print('Productos encontrados:');
      for (var producto in resultados) {
        producto.mostrarProducto();
      }
    } else {
      print('No se encontraron productos.');
    }
  } else {
    print('Criterio o valor de búsqueda no válidos.');
  }
}

void main() {
  while (true) {
    print("Seleccione una opción:");
    print("1. Buscar productos");
    print("2. Salir");

    String? opcion = stdin.readLineSync();

    if (opcion == '1') {
      buscarProducto();
    } else if (opcion == '2') {
      print("Saliendo del programa...");
      break;
    } else {
      print("Opción no válida. Inténtalo de nuevo.");
    }
  }
}
