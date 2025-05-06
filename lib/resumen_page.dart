import 'package:flutter/material.dart';

class ResumenPage extends StatelessWidget {
  final String name;
  final String age;
  final DateTime date;
  final String city;
  final String country;
  final double cuotaInicial;
  final double cuotaMensual;

  ResumenPage({
    required this.name,
    required this.age,
    required this.date,
    required this.city,
    required this.country,
    required this.cuotaInicial,
    required this.cuotaMensual,
  });

  @override
  Widget build(BuildContext context) {
    double valorFinal = cuotaInicial + cuotaMensual * 4;

    return Scaffold(
      appBar: AppBar(title: Text('Resumen')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nombres: $name'),
            Text('Edad: $age'),
            Text('Fecha: ${date.toString().split(' ')[0]}'),
            Text('Ciudad: $city'),
            Text('País: $country'),
            Text('Cuota inicial: \$${cuotaInicial.toStringAsFixed(2)}'),
            Text('Cuota mensual: \$${cuotaMensual.toStringAsFixed(2)}'),
            Text('Valor final: \$${valorFinal.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
