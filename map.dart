void main() {
  // Crear un mapa
  Map<String, int> numbersMap = {
    'Uno': 1,
    'Dos': 2,
    'Tres': 3,
  };

  // Agregar un par clave-valor
  numbersMap['Cuatro'] = 4;

  // Acceder a un valor por su clave
  print("Valor asociado a 'Dos': ${numbersMap['Dos']}");

  // Recorrer el mapa
  numbersMap.forEach((key, value) {
    print('Clave: $key, Valor: $value');
  });
}
