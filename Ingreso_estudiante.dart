import 'dart:io'; // Importación necesaria para leer desde la consola

void main() {
  print('Bienvenido al Módulo de Ingresar de Estudiante con su calificacion');

  // Captura de datos desde la consola
  print('Ingrese el nombre del Estudiante: ');
  String? nombre = stdin.readLineSync();

  print('Ingrese la Calificacion: ');
  String? calificacion = stdin.readLineSync();

  // Mostrar la información ingresada
  print('Ingreso con éxito Detalle del Ingreso');
  print('Estudiante: $nombre');
  print('Calificacion: $calificacion');
}
