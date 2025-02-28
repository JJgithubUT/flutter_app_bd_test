import 'dart:io';
import 'package:mongo_dart/mongo_dart.dart' as mongo;

class MongoService {
  // Singleton para la conexión a MongoDB
  static final MongoService _instance = MongoService._internal();
  
  late mongo.Db _db;

  MongoService._internal();

  factory MongoService() {
    return _instance;
  }

  Future<void> connect() async {
    try {
      _db = await mongo.Db.create(
        'mongodb+srv://juanjcbreton:Mmrckfv3CMFriMqK@cluster0.5zevd.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0'
      );
      await _db.open();
      _db.databaseName = 'productos';
      print('Conexión a MongoDB establecida.');
    } on SocketException catch (e) {
      print('Error de conexión: $e');
      rethrow;
    }
  }

  mongo.Db get db {
    if (!_db.isConnected) {
      throw StateError('DB no inicializada, llamar a connect()');
    }
    return _db;
  }

  void close() {
    _db.close();
  }
}
