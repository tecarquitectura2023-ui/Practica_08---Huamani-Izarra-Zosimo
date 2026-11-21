
import 'package:flutter/material.dart';

class ScreenEstudiante extends StatefulWidget {
  const ScreenEstudiante({super.key});

  @override
  State<ScreenEstudiante> createState() => _ScreenEstudianteState();
}

class _ScreenEstudianteState extends State<ScreenEstudiante> {
  final _formKey = GlobalKey<FormState>();

  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _correoController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Estudiante registrado exitosamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    _apellidoController.dispose();
    _correoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de estudiante'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Icon(
                Icons.school,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              // CAMPO NOMBRE
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su nombre',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // CAMPO APELLIDO
              TextFormField(
                controller: _apellidoController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su apellido',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su apellido';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // CAMPO CORREO
              TextFormField(
                controller: _correoController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su correo',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su correo';
                  }

                  if (!value.contains('@')) {
                    return 'Ingrese un correo válido';
                  }

                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registrar,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.all(16),
                  ),
                  child: const Text('REGISTRAR'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
