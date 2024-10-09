void main() {
  // Crear una lista de enteros
  List<int> numbers = [1, 2, 3, 4];

  // Agregar elementos
  numbers.add(5);

  // Acceder a un elemento por índice
  print("Primer número: ${numbers[0]}");

  // Recorrer la lista
  for (int number in numbers) {
    print(number);
  }
}
