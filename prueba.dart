import 'dart:io'; // Importación necesaria para leer desde la consola

void main() {
  print('Bienvenido al Módulo de Ingresar Productos');

  // Captura de datos desde la consola
  print('Ingrese el nombre del producto: ');
  String? nombre = stdin.readLineSync();

  print('Ingrese el precio del producto: ');
  String? precio = stdin.readLineSync();

  print('Ingrese la cantidad del producto: ');
  String? cantidad = stdin.readLineSync();

  print('Ingrese el stock del producto: ');
  String? stock = stdin.readLineSync();

  print('Ingrese la categoría del producto: ');
  String? categoria = stdin.readLineSync();

  // Mostrar la información ingresada
  print('Ingreso con éxito Detalle del Ingreso');
  print('Producto: $nombre');
  print('Precio: $precio');
  print('Cantidad: $cantidad');
  print('Total en Stock: $stock');
  print('Categoría: $categoria');
}
