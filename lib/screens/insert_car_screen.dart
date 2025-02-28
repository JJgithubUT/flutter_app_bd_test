import 'package:flutter/material.dart';
import 'package:flutter_app_bd_1/models/car_model.dart';
import 'package:flutter_app_bd_1/services/car_service.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class InsertCarScreen extends StatefulWidget {
  const InsertCarScreen({super.key});

  @override
  State<InsertCarScreen> createState() => _InsertCarScreenState();
}

class _InsertCarScreenState extends State<InsertCarScreen> {

  late TextEditingController _marcaController;
  late TextEditingController _modeloController;
  late TextEditingController _anyoController;
  late TextEditingController _numero_serieController;
  late TextEditingController _estadoController;
  late TextEditingController _precioController;

  @override
  void initState() {
    super.initState();
    _marcaController = TextEditingController();
    _modeloController = TextEditingController();
    _anyoController = TextEditingController();
    _numero_serieController = TextEditingController();
    _estadoController = TextEditingController();
    _precioController = TextEditingController();
  }

  void dispose() {
    _marcaController.dispose();
    _modeloController.dispose();
    _anyoController.dispose();
    _numero_serieController.dispose();
    _estadoController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  void _insertCar() async {
    var car = CarModel(
      id: mongo.ObjectId(),
      marca: _marcaController.text,
      modelo: _modeloController.text,
      anyo: int.parse(_anyoController.text),
      numero_serie: int.parse(_numero_serieController.text),
      estado: _estadoController.text,
      precio: double.parse(_precioController.text)
    );
    await CarService().insertCar(car);
    if ( !mounted ) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insertar nuevo Auto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _marcaController,
              decoration: const InputDecoration(labelText: 'Marca',),
            ),
            TextField(
              controller: _modeloController,
              decoration: const InputDecoration(labelText: 'Modelo',),
            ),
            TextField(
              controller: _anyoController,
              decoration: const InputDecoration(labelText: 'Año',),
            ),
            TextField(
              controller: _numero_serieController,
              decoration: const InputDecoration(labelText: 'Número de Serie',),
            ),
            TextField(
              controller: _estadoController,
              decoration: const InputDecoration(labelText: 'Estado',),
            ),
            TextField(
              controller: _precioController,
              decoration: const InputDecoration(labelText: 'Precio',),
            ),
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _insertCar,
              child: const Text('Insertar Auto'),
            )
          ],
        ),
      ),
    );
  }
}