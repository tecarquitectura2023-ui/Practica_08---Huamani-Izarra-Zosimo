
import 'package:flutter/material.dart';

class ScreenNombre extends StatefulWidget {
  const ScreenNombre({super.key});

  @override
  State<ScreenNombre> createState() => _ScreenNombreState();
}

class _ScreenNombreState extends State<ScreenNombre> {

  final _formKey = GlobalKey<FormState>();
  final _nombreController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Registro exitoso'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Formulario de nombres'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              const Icon(
                Icons.person,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),
              // permite ingresar el nombre 
              TextFormField(
                controller: _nombreController,
                decoration: const InputDecoration(
                  labelText: 'Ingrese su nombre',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person_outline),
                ),
                
                // comprueva que el campo no este vacio
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Ingrese su nombre';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 25),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: registrar,
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
