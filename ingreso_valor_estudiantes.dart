import 'dart:io';

void main() {
  print('Bienvenido al sistema de calificaciones de estudiantes');

  // Lista para almacenar los nombres de los estudiantes y sus promedios
  List<Map<String, dynamic>> estudiantes = [
    {'nombre': 'Alexander', 'promedio': 8.0},
    {'nombre': 'Steven', 'promedio': 9.0},
    {'nombre': 'Dylan', 'promedio': 7.0},
    {'nombre': 'Tyler', 'promedio': 10.0},
  ];

  // Pedir al usuario que ingrese el valor de referencia para el promedio
  print(
      'Ingrese el valor del promedio para mostrar los estudiantes con promedio mayor: ');
  double? valorPromedio = double.tryParse(stdin.readLineSync()!);

  if (valorPromedio != null) {
    print('Estudiantes con un promedio mayor a $valorPromedio:');

    // Mostrar estudiantes cuyo promedio sea mayor al valor ingresado
    for (var estudiante in estudiantes) {
      if (estudiante['promedio'] > valorPromedio) {
        print('${estudiante['nombre']}, ${estudiante['promedio']}');
      }
    }
  } else {
    print('Por favor ingrese un valor válido.');
  }
}
