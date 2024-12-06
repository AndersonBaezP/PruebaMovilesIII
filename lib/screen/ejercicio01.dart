import 'package:flutter/material.dart';

class Ejercicio01 extends StatefulWidget {
  const Ejercicio01({super.key});

  @override
  _Ejercicio01State createState() => _Ejercicio01State();
}

class _Ejercicio01State extends State<Ejercicio01> {
  final _velocidadInicialController = TextEditingController();
  final _velocidadFinalController = TextEditingController();
  String _resultado = "";

  void calcularTiempo() {
    final velocidadInicial = double.tryParse(_velocidadInicialController.text);
    final velocidadFinal = double.tryParse(_velocidadFinalController.text);
    const aceleracion = 10.0; // Aceleración media conocida

    // Validar los valores de entrada
    if (velocidadInicial == null || velocidadFinal == null || velocidadInicial < 0 || velocidadFinal < 0) {
      setState(() {
        _resultado = "Por favor, introduce valores válidos para las velocidades.";
      });
      return;
    }

    // Calcular tiempo usando la fórmula
    final tiempo = (velocidadFinal - velocidadInicial) / aceleracion;

    // Determinar si el vehículo aprueba
    String mensaje;
    if (tiempo <= 10) {
      mensaje = "El vehículo aprueba la prueba.";
    } else {
      mensaje = "El vehículo no aprueba la prueba.";
    }

    setState(() {
      _resultado = "Tiempo: ${tiempo.toStringAsFixed(2)} segundos\n$mensaje";
    });

    // Limpiar los campos después de calcular
    _velocidadInicialController.clear();
    _velocidadFinalController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Velocidad de Vehículos")),
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
                controller: _velocidadInicialController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Velocidad Inicial (m/s)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _velocidadFinalController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                  labelText: "Velocidad Final (m/s)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: calcularTiempo,
                child: const Text("Calcular Tiempo"),
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
