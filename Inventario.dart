import 'dart:io'; // Importación necesaria para manejar stdin

// Clase para representar un Producto
class Producto {
  String nombre;
  double precio;
  int cantidad;
  String categoria;

  // Constructor de la clase Producto
  Producto(this.nombre, this.precio, this.cantidad, this.categoria);

  // Método para mostrar información del producto
  void mostrarProducto() {
    print("Nombre: $nombre");
    print("Precio: \$${precio.toStringAsFixed(2)}");
    print("Cantidad en stock: $cantidad");
    print("Categoría: $categoria");
    print("------------------------");
  }
}

// Lista para almacenar el inventario
List<Producto> inventario = [];

// Función para agregar un nuevo producto al inventario
void agregarProducto() {
  print("Introduce el nombre del producto:");
  String? nombre = stdin.readLineSync();
  if (nombre == null || nombre.isEmpty) {
    print("Nombre no válido.");
    return;
  }

  print("Introduce el precio del producto:");
  String? inputPrecio = stdin.readLineSync();
  double? precio = double.tryParse(inputPrecio ?? '');
  if (precio == null) {
    print("Precio no válido.");
    return;
  }

  print("Introduce la cantidad en stock:");
  String? inputCantidad = stdin.readLineSync();
  int? cantidad = int.tryParse(inputCantidad ?? '');
  if (cantidad == null) {
    print("Cantidad no válida.");
    return;
  }

  print("Introduce la categoría del producto:");
  String? categoria = stdin.readLineSync();
  if (categoria == null || categoria.isEmpty) {
    print("Categoría no válida.");
    return;
  }

  // Crear el nuevo producto y agregarlo al inventario
  Producto nuevoProducto = Producto(nombre, precio, cantidad, categoria);
  inventario.add(nuevoProducto);

  print("Producto agregado exitosamente!");
}

// Función para mostrar todos los productos en el inventario
void mostrarInventario() {
  if (inventario.isEmpty) {
    print("El inventario está vacío.");
  } else {
    print("Productos en el inventario:");
    for (var producto in inventario) {
      producto.mostrarProducto();
    }
  }
}

void main() {
  while (true) {
    print("Seleccione una opción:");
    print("1. Agregar un producto");
    print("2. Mostrar inventario");
    print("3. Salir");

    String? opcion = stdin.readLineSync();
    if (opcion == '1') {
      print("Agregar un producto seleccionado"); // Mensaje de depuración
      agregarProducto();
    } else if (opcion == '2') {
      mostrarInventario();
    } else if (opcion == '3') {
      print("Saliendo del programa...");
      break;
    } else {
      print("Opción no válida. Inténtalo de nuevo.");
    }
  }
}
