import 'dart:io';

void main() {
  print('Bienvenido al Módulo de Calcular el promedio de los Estudiantes');

  // Captura del nombre del estudiante
  print('Ingrese el nombre del Estudiante: ');
  String? nombre = stdin.readLineSync();

  // Variables para la suma de calificaciones
  double sumaCalificaciones = 0;
  int cantidadNotas = 5;

  // Ciclo para ingresar exactamente 5 notas
  for (int i = 1; i <= cantidadNotas; i++) {
    print('Ingrese la Calificación $i: ');
    String? input = stdin.readLineSync();

    // Convertir la entrada a un número
    double? calificacion = double.tryParse(input!);

    if (calificacion != null && calificacion >= 0) {
      sumaCalificaciones += calificacion;
    } else {
      print('Por favor ingrese una calificación válida.');
      i--; // Decrementar el contador para repetir la misma calificación si el valor no es válido
    }
  }

  // Calcular el promedio
  double promedio = sumaCalificaciones / cantidadNotas;
  print('Estudiante: $nombre');
  print('Promedio de las calificaciones: $promedio');
}
