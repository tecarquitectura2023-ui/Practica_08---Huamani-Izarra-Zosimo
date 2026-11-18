
import 'package:flutter/material.dart';
import '../controllers/combustible_controller.dart';

class ScreenCombustible extends StatefulWidget {
  const ScreenCombustible({super.key});

  @override
  State<ScreenCombustible> createState() =>
      _ScreenCombustibleState();
}

class _ScreenCombustibleState extends State<ScreenCombustible> {

  final marcaController = TextEditingController();
  final distanciaController = TextEditingController();
  final litrosController = TextEditingController();

  final CombustibleController combustibleController =
      CombustibleController();

  String resultado = '';
  String estado = '';

  void calcular() {
    if (marcaController.text.trim().isEmpty ||
        distanciaController.text.trim().isEmpty ||
        litrosController.text.trim().isEmpty) {
      setState(() {
        resultado = '';
        estado = 'Complete todos los campos';
      });
      return;
    }

    double? distancia =
        double.tryParse(distanciaController.text);

    double? litros =
        double.tryParse(litrosController.text);

    if (distancia == null || litros == null ||
        distancia <= 0 || litros <= 0) {
      setState(() {
        resultado = '';
        estado = 'La distancia y los litros deben ser mayores que cero';
      });
      return;
    }

    double rendimiento =
        combustibleController.calcularRendimiento(
      distancia,
      litros,
    );

    setState(() {
      resultado =
          'Rendimiento: ${rendimiento.toStringAsFixed(2)} km/L';

      estado =
          combustibleController.obtenerEstado(rendimiento);
    });
  }

  @override
  void dispose() {
    marcaController.dispose();
    distanciaController.dispose();
    litrosController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consumo de combustible'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Icon(
              Icons.directions_car,
              size: 70,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: marcaController,
              decoration: const InputDecoration(
                labelText: 'Marca del vehículo',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.car_rental),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: distanciaController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Distancia recorrida (km)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.route),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: litrosController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Combustible utilizado (litros)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.local_gas_station),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular rendimiento'),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 10),

            Text(
              estado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
