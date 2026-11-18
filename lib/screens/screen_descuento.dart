
import 'package:flutter/material.dart';
import '../controllers/descuento_controller.dart';

class ScreenDescuento extends StatefulWidget {
  const ScreenDescuento({super.key});

  @override
  State<ScreenDescuento> createState() => _ScreenDescuentoState();
}

class _ScreenDescuentoState extends State<ScreenDescuento> {

  final nombreController = TextEditingController();
  final precioController = TextEditingController();
  final porcentajeController = TextEditingController();

  final DescuentoController descuentoController =
      DescuentoController();

  String resultado = '';

  void calcular() {
    if (nombreController.text.trim().isEmpty ||
        precioController.text.trim().isEmpty ||
        porcentajeController.text.trim().isEmpty) {
      setState(() {
        resultado = 'Complete todos los campos';
      });
      return;
    }

    double? precio = double.tryParse(precioController.text);
    double? porcentaje =
        double.tryParse(porcentajeController.text);

    if (precio == null || precio <= 0) {
      setState(() {
        resultado = 'Ingrese un precio mayor que cero';
      });
      return;
    }

    if (porcentaje == null ||
        porcentaje < 0 ||
        porcentaje > 100) {
      setState(() {
        resultado = 'El descuento debe estar entre 0 y 100 %';
      });
      return;
    }

    double descuento =
        descuentoController.calcularDescuento(precio, porcentaje);

    double precioFinal =
        descuentoController.calcularPrecioFinal(precio, porcentaje);

    String tipo =
        descuentoController.obtenerTipoDescuento(porcentaje);

    setState(() {
      resultado =
          'Producto: ${nombreController.text}\n'
          'Precio original: S/ ${precio.toStringAsFixed(2)}\n'
          'Porcentaje: ${porcentaje.toStringAsFixed(2)} %\n'
          'Descuento aplicado: S/ ${descuento.toStringAsFixed(2)}\n'
          'Precio final: S/ ${precioFinal.toStringAsFixed(2)}\n'
          '$tipo';
    });
  }

  @override
  void dispose() {
    nombreController.dispose();
    precioController.dispose();
    porcentajeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Descuento de productos'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            const Icon(
              Icons.shopping_cart,
              size: 70,
              color: Colors.orange,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: nombreController,
              decoration: const InputDecoration(
                labelText: 'Nombre del producto',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.inventory),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: precioController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Precio del producto (S/)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: porcentajeController,
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                labelText: 'Porcentaje de descuento (%)',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.percent),
              ),
            ),

            const SizedBox(height: 20),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: calcular,
                child: const Text('Calcular descuento'),
              ),
            ),

            const SizedBox(height: 20),

            Text(
              resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                height: 1.7,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
