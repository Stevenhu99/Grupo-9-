import 'dart:io';

void main() {
  print('Bienvenido al Módulo de Calcular el promedio de los Estudiantes');

  // Captura del nombre del estudiante
  print('Ingrese el nombre del Estudiante: ');
  String? nombre = stdin.readLineSync();

  // Captura del nombre de la asignatura
  print('Ingrese el nombre de la Asignatura: ');
  String? asignatura = stdin.readLineSync();

  // Variables para la suma de calificaciones
  double sumaCalificaciones = 0;
  int cantidadNotas = 5;
  List<double> calificaciones = [];

  // Ciclo para ingresar exactamente 5 notas
  for (int i = 1; i <= cantidadNotas; i++) {
    print('Ingrese la Calificación $i: ');
    String? input = stdin.readLineSync();

    // Convertir la entrada a un número
    double? calificacion = double.tryParse(input!);

    if (calificacion != null && calificacion >= 0) {
      calificaciones.add(calificacion); // Añadir calificación a la lista
      sumaCalificaciones += calificacion;
    } else {
      print('Por favor ingrese una calificación válida.');
      i--; // Repetir la iteración si el valor no es válido
    }
  }

  // Calcular el promedio
  double promedio = sumaCalificaciones / cantidadNotas;

  // Determinar la calificación más alta y más baja
  double calificacionMax = calificaciones.reduce((a, b) => a > b ? a : b);
  double calificacionMin = calificaciones.reduce((a, b) => a < b ? a : b);

  // Mostrar los resultados
  print('Estudiante: $nombre');
  print('Asignatura: $asignatura');
  print('Promedio de las calificaciones: $promedio');
  print('Calificación más alta: $calificacionMax');
  print('Calificación más baja: $calificacionMin');
}
