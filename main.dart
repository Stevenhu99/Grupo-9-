import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'App de Tarea 2',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 255, 196, 34)),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  // Genera una lista de elementos con su descripción e imágenes
  final List<Map<String, String>> items = List.generate(5, (index) {
    var wordPair = WordPair.random();
    return {
      'element': wordPair.asPascalCase,
      'description': 'Imagen ${index + 1}: ${wordPair.asPascalCase}.',
      'imageUrl':
          'https://picsum.photos/seed/${index + 1}/200/300', // URL aleatoria de imagen
    };
  });

  // Método para actualizar la lista generando nuevos elementos aleatorios
  void generateNewItems() {
    items.clear();
    for (int i = 0; i < 5; i++) {
      var wordPair = WordPair.random();
      items.add({
        'element': wordPair.asPascalCase,
        'description':
            'Descripción  imagen:${i + 1}: ${wordPair.asPascalCase}.',
        'imageUrl': 'https://picsum.photos/seed/${i + 1}/200/300',
      });
    }
    notifyListeners();
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var appState =
        context.watch<MyAppState>(); // Escucha el estado de la aplicación

    return Scaffold(
      appBar: AppBar(
        title: const Text('Galeria de Imágenes'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              appState.generateNewItems(); // Refrescar elementos
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Imagenes Naturales y Escructuras:',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: appState.items.length,
                itemBuilder: (context, index) {
                  var item = appState.items[index];
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      leading: Image.network(
                        item['imageUrl']!,
                        width: 60,
                        height: 60,
                        fit: BoxFit.cover,
                      ),
                      title: Text(item['element']!),
                      subtitle: Text(item['description']!),
                      trailing: IconButton(
                        icon: const Icon(Icons.favorite_border),
                        onPressed: () {
                          // Aquí podrías agregar una funcionalidad extra como guardar favoritos
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(
                                '${item['element']} guardado como favorito!'),
                          ));
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    appState.generateNewItems(); // Genera nuevos elementos
                  },
                  child: const Text('Mirar más '),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('¡Funcionalidad extra activada!'),
                    ));
                  },
                  child: const Text('Regresar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
