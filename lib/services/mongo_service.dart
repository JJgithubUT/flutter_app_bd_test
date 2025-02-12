import 'package:flutter_app_bd_1/models/phone_model.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MongoService {
  // Servicio para conectar con mongoDB Atlas usando Sigletown
  static final MongoService _instance = MongoService._internal();

  late mongo.Db _db;

  MongoService._internal();

  factory MongoService() {
    return _instance;
  }

  Future<void> connect() async {
    await dotenv.load(fileName: ".env");
    final mongoUri = dotenv.env['MONGO_URI'];
    _db = await mongo.Db.create(mongoUri!);
    await _db.open();
  }

  mongo.Db get db {
    if ( !db.isConnected ) {
      throw StateError('Base De Datos No Inicializada, llama a connect() primero');
    }
    return _db;
  }

  Future<List<PhoneModel>> getCelulares() async {
    final collection = _db.collection('celulares');
    var phones = await collection.find().toList();
    return phones.map((phone) => PhoneModel.fromJson(phone)).toList();
  }

}