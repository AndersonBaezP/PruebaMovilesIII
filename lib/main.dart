import 'package:flutter/material.dart';
import 'package:prueba_01/navegadores/drawer.dart';
import 'package:prueba_01/screen/ejercicio02.dart';

void main() {
  runApp(const Prueba01());
}

class Prueba01 extends StatelessWidget {
  const Prueba01({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Cuerpo(),
    );
  }
}

class Cuerpo extends StatelessWidget {
  const Cuerpo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: const Text("Prueba"),
        backgroundColor: Colors.blueAccent,
      ),
      drawer:const MiDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/imagen/ima.jpg', fit: BoxFit.cover),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Nombre: Anderson Baez',
                  style: TextStyle(fontSize: 30, color: Color.fromARGB(255, 207, 2, 2)),
                ),
                Text(
                  'GitHub: github.com/AndersonBaezP',
                  style: TextStyle(fontSize: 25, color: Color.fromARGB(255, 235, 6, 6)),
                ),
            
              ],
            ),
          ),
        ],
      ),
    );
  }

  void mostrarAlerta(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmación"),
          content: const Text("¿Deseas ir al Ejercicio02?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(), 
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
                navegar2(context); 
              },
              child: const Text("Aceptar"),
            ),
          ],
        );
      },
    );
  }

  void navegar2(BuildContext context) {
    Navigator.push(context,MaterialPageRoute(builder: (context) => const Ejercicio02()),
    );
  }
}
