import 'package:flutter_app_bd_1/models/car_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'mongo_service.dart';

class CarService {
  final MongoService _mongoService = MongoService();

  Future<List<CarModel>> getCars() async {
    final collection = _mongoService.db.collection('autos');
    print('Colección obtenida: $collection');
    var cars = await collection.find().toList();
    print('En CarService: $cars');
    if (cars.isEmpty) {
      print('No se encontraron datos en la colección de autos.');
    }
    return cars.map((car) => CarModel.fromJson(car)).toList();
  }

  Future<void> insertCar(CarModel car) async {
    final collection = _mongoService.db.collection('autos');
    await collection.insertOne(car.toJson());
  }

  Future<void> updateCar(CarModel car) async {
    final collection = _mongoService.db.collection('autos');
    await collection.updateOne(
      mongo.where.eq('_id', car.id),
      mongo.modify
          .set('marca', car.marca)
          .set('modelo', car.modelo)
          .set('anyo', car.anyo)
          .set('numero_serie', car.numero_serie)
          .set('estado', car.estado)
          .set('precio', car.precio),
    );
  }

  Future<void> deleteCar(mongo.ObjectId id) async {
    final collection = _mongoService.db.collection('autos');
    await collection.remove(mongo.where.eq('_id', id));
  }

}