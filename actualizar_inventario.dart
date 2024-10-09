import 'dart:io'; // Para manejar la entrada desde la consola

// Clase para representar un Producto
class Producto {
  String nombre;
  int stock;

  // Constructor de la clase Producto
  Producto(this.nombre, this.stock);

  // Método para mostrar información del producto
  void mostrarProducto() {
    print("Producto: $nombre");
    print("Stock: $stock");
    print("------------------------");
  }
}

// Lista de productos (con stock inicial)
List<Producto> inventario = [
  Producto('Zapatos', 30),
  Producto('Velas', 50),
  Producto('Laptop', 10),
];

// Función para mostrar los productos y preguntar si desea cambiar el stock
void mostrarProductosYCambiarStock() {
  print('Productos disponibles:');

  // Mostrar todos los productos
  for (var producto in inventario) {
    producto.mostrarProducto();
  }

  // Preguntar si desea cambiar el stock
  print('¿Desea cambiar el stock de algún producto? (sí/no)');
  String? respuesta = stdin.readLineSync();

  if (respuesta != null && respuesta.toLowerCase() == 'si') {
    print('Ingrese el nombre del producto que desea modificar:');
    String? nombreProducto = stdin.readLineSync();

    // Buscar el producto en la lista
    Producto? productoEncontrado = inventario.firstWhere(
      (producto) =>
          producto.nombre.toLowerCase() == nombreProducto?.toLowerCase(),
      orElse: () =>
          Producto('No encontrado', 0), // Valor por defecto si no se encuentra
    );

    if (productoEncontrado.nombre != 'No encontrado') {
      print('Producto encontrado:');
      productoEncontrado.mostrarProducto();

      // Preguntar si desea aumentar o disminuir el stock
      print('¿Desea aumentar o disminuir el stock? (aumentar/disminuir)');
      String? accion = stdin.readLineSync();

      print('Ingrese la cantidad a ${accion}:');
      String? cantidadInput = stdin.readLineSync();
      int cantidad = int.tryParse(cantidadInput ?? '') ??
          0; // Usamos 0 si la entrada es nula

      if (cantidad >= 0) {
        int stockAnterior =
            productoEncontrado.stock; // Guardar el stock anterior

        if (accion != null && accion.toLowerCase() == 'aumentar') {
          productoEncontrado.stock += cantidad; // Aumentar el stock
          print(
              'El stock ha sido aumentado de $stockAnterior a ${productoEncontrado.stock}.');
        } else if (accion != null && accion.toLowerCase() == 'disminuir') {
          if (productoEncontrado.stock - cantidad >= 0) {
            productoEncontrado.stock -= cantidad; // Disminuir el stock
            print(
                'El stock ha sido disminuido de $stockAnterior a ${productoEncontrado.stock}.');
          } else {
            print('No se puede disminuir el stock por debajo de cero.');
          }
        } else {
          print('Acción no válida. Debe ser "aumentar" o "disminuir".');
        }
      } else {
        print('Cantidad no válida.');
      }
    } else {
      print('Producto no encontrado.');
    }
  } else {
    print('No se realizará ningún cambio en el stock.');
  }
}

void main() {
  mostrarProductosYCambiarStock();
}
