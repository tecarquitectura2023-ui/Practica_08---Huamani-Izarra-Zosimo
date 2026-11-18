
import 'package:flutter/material.dart';
import 'screen_promedio.dart';
import 'screen_pago.dart';
import 'screen_descuento.dart';
import 'screen_combustible.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica 07'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Calculadoras',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
                onPressed: () {
                  Navigator.push( // abre otra pantalla
                    context,
                    MaterialPageRoute( // prepara la navegacion 
                      builder: (context) => const ScreenPromedio(), // crea y muestra la pantalla del promedio
                    ),
                  );
                },
                child: const Text('1. Promedio académico'),
              ),

            ElevatedButton(
              onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ScreenPago(),
                ),
              );
            },
              child: const Text('2. Pago de trabajador'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenDescuento(),
                  ),
                );
              },
              child: const Text('3. Descuento de productos'),
            ),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenCombustible(),
                  ),
                );         
              },
              child: const Text('4. Consumo de combustible'),
            ),
          ],
        ),
      ),
    );
  }
}
