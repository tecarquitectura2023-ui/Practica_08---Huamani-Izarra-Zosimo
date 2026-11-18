
import 'package:flutter/material.dart';
import '../controllers/promedio_controller.dart';

class ScreenPromedio extends StatefulWidget {
  const ScreenPromedio({super.key});

  @override
  State<ScreenPromedio> createState() => _ScreenPromedioState();
}

class _ScreenPromedioState extends State<ScreenPromedio> {
// estos controladores permiten obtener los datos
  final nombreController = TextEditingController();
  final nota1Controller = TextEditingController();
  final nota2Controller = TextEditingController();
  final nota3Controller = TextEditingController();
// crea un objeto del controlador para utilizar sus metodos de calculo
  final PromedioController promedioController =
      PromedioController();

  String resultado = '';
  String estado = '';

  void calcular() {
    if (nombreController.text.isEmpty ||
        nota1Controller.text.isEmpty ||
        nota2Controller.text.isEmpty ||
        nota3Controller.text.isEmpty) {
      setState(() {
        resultado = '';
        estado = 'Complete todos los campos';
      });
      return;
    }
// valida los datos
    double? nota1 = double.tryParse(nota1Controller.text);
    double? nota2 = double.tryParse(nota2Controller.text);
    double? nota3 = double.tryParse(nota3Controller.text);

    if (nota1 == null || nota2 == null || nota3 == null ||
        nota1 < 0 || nota1 > 20 ||
        nota2 < 0 || nota2 > 20 ||
        nota3 < 0 || nota3 > 20) {
      setState(() {
        resultado = '';
        estado = 'Las notas deben estar entre 0 y 20';
      });
      return;
    }
    // calcula el promedio
    double promedio = promedioController.calcularPromedio(
      nota1,
      nota2,
      nota3,
    );
    // muestra el resultado
    setState(() {
      resultado = 'Promedio: ${promedio.toStringAsFixed(2)}';
      estado = promedioController.obtenerEstado(promedio);
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    nota1Controller.dispose();
    nota2Controller.dispose();
    nota3Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Promedio académico'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.school,
              size: 70,
              color: Colors.blue,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del estudiante',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nota1Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Nota 1',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nota2Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Nota 2',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: nota3Controller,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Nota 3',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular promedio'),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(
              estado,
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
