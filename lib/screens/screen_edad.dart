
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenEdad extends StatefulWidget {
  const ScreenEdad({super.key});

  @override
  State<ScreenEdad> createState() => _ScreenEdadState();
}

class _ScreenEdadState extends State<ScreenEdad> {
  final _formKey = GlobalKey<FormState>();
  final _edadController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Edad registrada correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de edad'),
        centerTitle: true,
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
                Icons.cake,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              TextFormField(
                controller: _edadController,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Ingrese su edad',
                  prefixIcon: Icon(Icons.calendar_today),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su edad';
                  }

                  final edad = int.tryParse(value);

                  if (edad == null) {
                    return 'Ingrese solamente números';
                  }

                  if (edad < 18) {
                    return 'Debe tener 18 años o más';
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
