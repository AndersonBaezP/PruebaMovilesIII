import 'package:flutter/material.dart';
import 'package:prueba_01/screen/ejercicio01.dart';
import 'package:prueba_01/screen/ejercicio02.dart';

class MiDrawer extends StatelessWidget {
  const MiDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text("Navegación", style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
          ListTile(
            title: const Text("Ejercicio 01"),
            onTap: () => Navigator.push( context,MaterialPageRoute(builder: (context) => const Ejercicio01()),
            ),
          ),
          ListTile(
            title: const Text("Ejercicio 02"),
            onTap: () => Navigator.push(context,MaterialPageRoute(builder: (context) => const Ejercicio02()),
            ),
          ),
        ],
      ),
    );
  }
}
