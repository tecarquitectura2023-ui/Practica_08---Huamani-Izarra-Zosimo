
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenDni extends StatefulWidget {
  const ScreenDni({super.key});

  @override
  State<ScreenDni> createState() => _ScreenDniState();
}

class _ScreenDniState extends State<ScreenDni> {
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();

  void registrar() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('DNI registrado correctamente'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  void dispose() {
    _dniController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de DNI'),
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
                Icons.badge,
                size: 80,
                color: Colors.blue,
              ),

              const SizedBox(height: 25),

              TextFormField(
                controller: _dniController,
                keyboardType: TextInputType.number,
                maxLength: 8,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: const InputDecoration(
                  labelText: 'Ingrese su número de DNI',
                  prefixIcon: Icon(Icons.credit_card),
                  border: OutlineInputBorder(),
                  counterText: '',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Ingrese su DNI';
                  }

                  if (value.length != 8) {
                    return 'DNI incorrecto';
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
