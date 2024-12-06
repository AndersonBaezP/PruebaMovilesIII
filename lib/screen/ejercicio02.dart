
import 'package:flutter/material.dart';

class Ejercicio02 extends StatefulWidget {
  const Ejercicio02({super.key});

  @override
  _Ejercicio02State createState() => _Ejercicio02State();
}

class _Ejercicio02State extends State<Ejercicio02> {
  final _alturaController = TextEditingController();
  String _resultado = "";

  void calcularPresion() {
    const double densidad = 1025;
    const double gravedad = 9.8; 
    final altura = double.tryParse(_alturaController.text);

    if (altura == null || altura <= 0) {
      setState(() {
        _resultado = "Por favor, introduce un valor válido para la altura.";
      });
      return;
    }

    final presion = densidad * gravedad * altura;

    setState(() {
      _resultado = "Presión: ${presion.toStringAsFixed(2)} Pa";
    });

    _alturaController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Cálculo de Presión en el Mar")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                'https://itsqmet.hiringroom.com/data/accounts/itsqmet/microsite/102161f242a93e76d31a2f84888f1b86.jpg',
                height: 400,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _alturaController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Altura (m)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularPresion,
                child: const Text("Calcular Presión"),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  _resultado,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

