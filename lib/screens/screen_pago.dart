import 'package:flutter/material.dart';
import '../controllers/pago_controller.dart';

class ScreenPago extends StatefulWidget {
  const ScreenPago({super.key});

  @override
  State<ScreenPago> createState() => _ScreenPagoState();
}

class _ScreenPagoState extends State<ScreenPago> {

  final nombreController = TextEditingController();
  final horasController = TextEditingController();
  final pagoHoraController = TextEditingController();

  final PagoController pagoController = PagoController();

  String resultado = '';

  void calcular() {
    if (nombreController.text.trim().isEmpty ||
        horasController.text.trim().isEmpty ||
        pagoHoraController.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? horas = double.tryParse(horasController.text);
    double? pagoHora = double.tryParse(pagoHoraController.text);

    if (horas == null || pagoHora == null ||
        horas < 0 || pagoHora < 0) {
      setState(() {
        resultado = 'Ingrese valores numéricos no negativos';
      });
      return;
    }

    double sueldo = pagoController.calcularSueldo(
      horas,
      pagoHora,
    );

    setState(() {
      resultado =
          'Trabajador: ${nombreController.text}\n'
          'Sueldo total: S/ ${sueldo.toStringAsFixed(2)}';
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    horasController.dispose();
    pagoHoraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pago de trabajador'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.account_balance_wallet,
              size: 70,
              color: Colors.green,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del trabajador',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: horasController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Horas trabajadas',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.access_time),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: pagoHoraController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Pago por hora (S/)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular sueldo'),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
