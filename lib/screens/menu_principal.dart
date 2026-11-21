
import 'package:flutter/material.dart';
import 'screen_nombre.dart';
import 'screen_correo.dart';
import 'screen_edad.dart';
import 'screen_dni.dart';
import 'screen_password.dart';
import 'screen_estudiante.dart';

class MenuPrincipal extends StatelessWidget {
  const MenuPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        title: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'PRÁCTICA CALIFICADA',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '(Formulario, validación y personalización)',
              style: TextStyle(
                fontSize: 12,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.assignment,
              size: 80,
              color: Colors.blue,
            ),
            const SizedBox(height: 10),

            const Text(
              'FORMULARIOS Y VALIDACIONES',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 25),

            _crearBoton(
              context,
              '1. Formulario de nombres',
              Icons.person,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenNombre(),
                  ),
                );
              },
            ),

            _crearBoton(
              context,
              '2. Formulario de correo',
              Icons.email,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenCorreo(),
                  ),
                );
              },
            ),

            _crearBoton(
              context,
              '3. Registro de edad',
              Icons.cake,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenEdad(),
                  ),
                );
              },
            ),

            _crearBoton(
              context,
              '4. Registro de DNI',
              Icons.badge,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenDni(),
                  ),
                );
              },
            ),

            _crearBoton(
              context,
              '5. Registro de contraseña',
              Icons.lock,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenPassword(),
                  ),
                );
              },
            ),

            _crearBoton(
              context,
              '6. Formulario de estudiante',
              Icons.school,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenEstudiante(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _crearBoton(
    BuildContext context,
    String titulo,
    IconData icono,
    VoidCallback accion,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 12),
      child: ElevatedButton.icon(
        onPressed: accion,
        icon: Icon(icono),
        label: Text(titulo),
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(16),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
