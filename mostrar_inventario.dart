import 'dart:io'; // Para manejar la entrada desde la consola

// Clase para representar un Producto
class Producto {
  String nombre;
  // Constructor de la clase Producto
  Producto(this.nombre);

  // Método para mostrar información del producto
  void mostrarProducto() {
    print("Producto: $nombre");
    print("------------------------");
  }
}

// Lista de productos (con stock inicial y precio)
List<Producto> Ropa = [
  Producto('Zapatos'), // Precio de 50.0
  Producto('Camisas'), // Precio de 2.5
  Producto('Jeans'), // Precio de 800.0
];

List<Producto> Limpieza = [
  Producto('Jabon'), // Precio de 50.0
  Producto('Shampo'), // Precio de 2.5
  Producto('Detergente'), // Precio de 800.0
];

List<Producto> Frutas = [
  Producto('Manzana'), // Precio de 50.0
  Producto('Pera'), // Precio de 2.5
  Producto('Uva'), // Precio de 800.0
];

void mostrarProducto() {
  if (Ropa.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("Productos en el inventario:");
    for (var producto in Ropa) {
      producto.mostrarProducto();
    }
  }
}

void mostrarLimpieza() {
  if (Limpieza.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("Productos en el inventario:");
    for (var producto in Limpieza) {
      producto.mostrarProducto();
    }
  }
}

void mostrarFrutas() {
  if (Frutas.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("Productos en el inventario:");
    for (var producto in Frutas) {
      producto.mostrarProducto();
    }
  }
}

void main() {
  while (true) {
    print('Que Categoria desea Buscar Ejemplo: Ropa, Limpieza, Frutas');

    String? opcion = stdin.readLineSync();

    if (opcion == 'Ropa') {
      print("Productos de Ropa: "); // Mensaje de depuración
      mostrarProducto();
    } else if (opcion == 'Limpieza') {
      print("Productos de Limpieza: ");
      mostrarLimpieza();
    } else if (opcion == 'Frutas') {
      print("Productos de Frutas: ");
      mostrarFrutas();
      break;
    } else {
      print("Opción no válida. Inténtalo de nuevo.");
    }
  }
}
