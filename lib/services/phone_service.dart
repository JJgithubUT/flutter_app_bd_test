import 'package:flutter_app_bd_1/models/phone_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'mongo_service.dart';

class PhoneService {
  final MongoService _mongoService = MongoService();

  Future<List<PhoneModel>> getPhones() async {
    final collection = _mongoService.db.collection('celulares');
    print('Colección obtenida: $collection');
    var phones = await collection.find().toList();
    print('En PhoneService: $phones');
    if (phones.isEmpty) {
      print('No se encontraron datos en la colección de celulares.');
    }
    return phones.map((phone) => PhoneModel.fromJson(phone)).toList();
  }

  Future<void> insertPhone(PhoneModel phone) async {
    final collection = _mongoService.db.collection('celulares');
    await collection.insertOne(phone.toJson());
  }

  Future<void> updatePhone(PhoneModel phone) async {
    final collection = _mongoService.db.collection('celulares');
    await collection.updateOne(
      mongo.where.eq('_id', phone.id),
      mongo.modify
          .set('marca', phone.marca)
          .set('modelo', phone.modelo)
          .set('existencia', phone.existencia)
          .set('precio', phone.precio),
    );
  }

  Future<void> deletePhone(mongo.ObjectId id) async {
    final collection = _mongoService.db.collection('celulares');
    await collection.remove(mongo.where.eq('_id', id));
  }
}
