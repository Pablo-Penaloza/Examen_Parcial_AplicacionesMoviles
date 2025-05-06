import 'package:flutter/material.dart';
import 'resumen_page.dart';

class RegisterStudentPage extends StatefulWidget {
  @override
  _RegisterStudentPageState createState() => _RegisterStudentPageState();
}

class _RegisterStudentPageState extends State<RegisterStudentPage> {
  final _nameController = TextEditingController();
  final _ageController = TextEditingController();
  final _initialPaymentController = TextEditingController();

  String? selectedCountry;
  String? selectedCity;
  DateTime? selectedDate;
  double cuotaMensual = 0.0;

  final Map<String, List<String>> countries = {
    'Ecuador': ['Quito', 'Guayas', 'Cuenca', 'Loja'],
    'Colombia': ['Bogotá', 'Medellín', 'Cali', 'Pasto'],
  };

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) setState(() => selectedDate = picked);
  }

  void _calculateCuota() {
    double inicial = double.tryParse(_initialPaymentController.text) ?? 0;
    double restante = 1500 - inicial;
    cuotaMensual = (restante / 4) * 1.05;
  }

  void _goToResumen() {
    _calculateCuota();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ResumenPage(
          name: _nameController.text,
          age: _ageController.text,
          date: selectedDate!,
          city: selectedCity!,
          country: selectedCountry!,
          cuotaInicial: double.parse(_initialPaymentController.text),
          cuotaMensual: cuotaMensual,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: ListView(
          children: [
            Center(
              child: Text(
                'Registro de estudiantes',
                style: TextStyle(fontSize: 15, color: Colors.blue),
              ),
            ),
            ElevatedButton(
              onPressed: _pickDate,
              child: Text(selectedDate == null
                  ? 'Seleccionar fecha'
                  : selectedDate.toString().split(' ')[0]),
            ),
            DropdownButton<String>(
              value: selectedCountry,
              hint: Text('Seleccionar país'),
              items: countries.keys
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() {
                  selectedCountry = val;
                  selectedCity = null;
                });
              },
            ),
            DropdownButton<String>(
              value: selectedCity,
              hint: Text('Seleccionar ciudad'),
              items: selectedCountry == null
                  ? []
                  : countries[selectedCountry]!
                      .map((c) => DropdownMenuItem(value: c, child: Text(c)))
                      .toList(),
              onChanged: (val) => setState(() => selectedCity = val),
            ),
            Text('Valor del curso: 1500'),
            TextField(
              controller: _initialPaymentController,
              decoration: InputDecoration(labelText: 'Cuota inicial'),
              keyboardType: TextInputType.number,
              onChanged: (_) => setState(() => _calculateCuota()),
            ),
            Text('Cuota mensual: ${cuotaMensual.toStringAsFixed(2)}'),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nombres'),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Edad'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (selectedCity != null &&
                    selectedCountry != null &&
                    selectedDate != null) {
                  _goToResumen();
                }
              },
              child: Text('Ver resumen'),
            )
          ],
        ),
      ),
    );
  }
}
