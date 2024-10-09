class Estudiante {
  String nombre;
  Map<String, double> calificaciones = {};

  Estudiante(this.nombre);

  // Método para añadir calificación
  void anadirCalificacion(String asignatura, double calificacion) {
    calificaciones[asignatura] = calificacion;
  }

  // Método para calcular el promedio
  double calcularPromedio() {
    if (calificaciones.isEmpty) return 0.0;
    double suma = calificaciones.values.reduce((a, b) => a + b);
    return suma / calificaciones.length;
  }

  // Método para obtener las calificaciones extremas
  Map<String, double> obtenerCalificacionesExtremas() {
    if (calificaciones.isEmpty) return {};
    double maxCalificacion =
        calificaciones.values.reduce((a, b) => a > b ? a : b);
    double minCalificacion =
        calificaciones.values.reduce((a, b) => a < b ? a : b);
    return {'Max': maxCalificacion, 'Min': minCalificacion};
  }
}

class Escuela {
  List<Estudiante> estudiantes = [];

  // Método para añadir estudiante
  void anadirEstudiante(Estudiante estudiante) {
    estudiantes.add(estudiante);
  }

  // Método para obtener estudiantes con promedio superior a un umbral
  List<Estudiante> obtenerEstudiantesPromedioSuperior(double promedioUmbral) {
    return estudiantes
        .where((estudiante) => estudiante.calcularPromedio() > promedioUmbral)
        .toList();
  }

  // Método para ordenar estudiantes por promedio
  void ordenarEstudiantesPorPromedio(bool ascendente) {
    estudiantes.sort((a, b) {
      if (ascendente) {
        return a.calcularPromedio().compareTo(b.calcularPromedio());
      } else {
        return b.calcularPromedio().compareTo(a.calcularPromedio());
      }
    });
  }
}

void main() {
  var escuela = Escuela();

  // Añadiendo estudiantes y sus calificaciones
  var estudiante1 = Estudiante('Juan');
  estudiante1.anadirCalificacion('Matematicas', 8.5);
  estudiante1.anadirCalificacion('Ciencias', 9.0);
  escuela.anadirEstudiante(estudiante1);

  var estudiante2 = Estudiante('María');
  estudiante2.anadirCalificacion('Matematicas', 7.0);
  estudiante2.anadirCalificacion('Ciencias', 8.5);
  escuela.anadirEstudiante(estudiante2);

  var estudiante3 = Estudiante('Pedro');
  estudiante3.anadirCalificacion('Matematicas', 9.5);
  estudiante3.anadirCalificacion('Ciencias', 10.0);
  escuela.anadirEstudiante(estudiante3);

  // Calcular y mostrar promedios
  for (var estudiante in escuela.estudiantes) {
    print('${estudiante.nombre} - Promedio: ${estudiante.calcularPromedio()}');
  }

  // Mostrar calificaciones extremas
  for (var estudiante in escuela.estudiantes) {
    var extremas = estudiante.obtenerCalificacionesExtremas();
    print(
        '${estudiante.nombre} - Calificaciones extremas: Max: ${extremas['Max']}, Min: ${extremas['Min']}');
  }

  // Mostrar estudiantes con promedio superior a un valor dado
  double promedioUmbral = 8.0;
  print('Estudiantes con promedio superior a $promedioUmbral:');
  for (var estudiante
      in escuela.obtenerEstudiantesPromedioSuperior(promedioUmbral)) {
    print(estudiante.nombre);
  }

  // Ordenar estudiantes por promedio de forma ascendente
  escuela.ordenarEstudiantesPorPromedio(true);
  print('Estudiantes ordenados por promedio (ascendente):');
  for (var estudiante in escuela.estudiantes) {
    print('${estudiante.nombre} - Promedio: ${estudiante.calcularPromedio()}');
  }

  // Ordenar estudiantes por promedio de forma descendente
  escuela.ordenarEstudiantesPorPromedio(false);
  print('Estudiantes ordenados por promedio (descendente):');
  for (var estudiante in escuela.estudiantes) {
    print('${estudiante.nombre} - Promedio: ${estudiante.calcularPromedio()}');
  }
}
