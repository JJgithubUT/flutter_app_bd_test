import 'package:flutter/material.dart';
import 'package:flutter_app_bd_1/models/car_model.dart';
import 'package:flutter_app_bd_1/screens/insert_car_screen.dart';
import 'package:flutter_app_bd_1/services/car_service.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class CarsScreen extends StatefulWidget {
  const CarsScreen({super.key});

  @override
  State<CarsScreen> createState() => _CarsScreenState();
}

class _CarsScreenState extends State<CarsScreen> {
  List<CarModel> cars = [];
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
    _fetchCars();
  }

  @override
  void dispose() {
    // Destruir esta screen cuando la app salga de esta ventana
    _marcaController.dispose();
    _modeloController.dispose();
    _anyoController.dispose();
    _numero_serieController.dispose();
    _estadoController.dispose();
    _precioController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Autos'),
        actions: [
          Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: GestureDetector(
            onTap: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const InsertCarScreen(),
                ),
              );
              _fetchCars();
            },
            child: const Icon(
              Icons.add,
              size: 26.0
            ),
           ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: cars.length,
        itemBuilder: (context, index) {
          var car = cars[index];
          return oneTile(car);
        },
      ),
    );
  }

  void _fetchCars() async {
    cars = await CarService().getCars();
    print('En fetch $cars');
    setState(() {});
  }

  void _updateCar(CarModel car) async {
    await CarService().updateCar(car);
    _fetchCars();
  }

  void _showEditDialog(CarModel car) {
    
    _marcaController.text = car.marca;
    _modeloController.text = car.modelo;
    _anyoController.text = car.anyo.toString();
    _numero_serieController.text = car.numero_serie.toString();
    _estadoController.text = car.estado;
    _precioController.text = car.precio.toString();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Editar Auto'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _marcaController,
                decoration: const InputDecoration(labelText: 'Marca'),
              ),
              TextField(
                controller: _modeloController,
                decoration: const InputDecoration(labelText: 'Modelo'),
              ),
              TextField(
                controller: _anyoController,
                decoration: const InputDecoration(labelText: 'Año'),
              ),
              TextField(
                controller: _numero_serieController,
                decoration: const InputDecoration(labelText: 'Número de Serie'),
              ),
              TextField(
                controller: _estadoController,
                decoration: const InputDecoration(labelText: 'Estado'),
              ),
              TextField(
                controller: _precioController,
                decoration: const InputDecoration(labelText: 'Precio'),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                // recuperar los nuevos valores
                car.marca = _marcaController.text;
                car.modelo = _modeloController.text;
                car.anyo = int.parse(_anyoController.text);
                car.numero_serie = int.parse(_numero_serieController.text);
                car.estado = _estadoController.text;
                car.precio = double.parse(_precioController.text);
                _updateCar(car);
                Navigator.pop(context);
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      }
      );

  }

  void _deleteCar(mongo.ObjectId id) async {
    await CarService().deleteCar(id);
    _fetchCars();
  }

  ListTile oneTile(CarModel car) {
    return ListTile(
      leading: const Icon(Icons.car_rental),
      title: Text(
        car.marca,
        style: Theme.of(context).textTheme.headlineSmall,
      ),
      subtitle: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${car.marca}, ${car.modelo}', style: Theme.of(context).textTheme.bodyMedium),

          Text('${car.anyo}, N°${car.numero_serie}', style: Theme.of(context).textTheme.bodySmall),

          Text('${car.estado}, \$${car.precio}'),
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => _showEditDialog(car),
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              _deleteCar(car.id);
            },
            icon: const Icon(Icons.delete),
          ),
        ],
      ),
    );
  }

}