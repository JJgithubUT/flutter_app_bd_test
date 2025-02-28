import 'package:mongo_dart/mongo_dart.dart' as mongo;

class CarModel {
  final mongo.ObjectId id;
  String marca;
  String modelo;
  int anyo;
  int numero_serie;
  String estado;
  double precio;

  CarModel({
    required this.id,
    required this.marca,
    required this.modelo,
    required this.anyo,
    required this.numero_serie,
    required this.estado,
    required this.precio
  });

  // Convertir un Map a Json
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'marca': marca,
      'modelo': modelo,
      'anyo': anyo,
      'numero_serie': numero_serie,
      'estado': estado,
      'precio': precio
    };
  }

  factory CarModel.fromJson(Map<String, dynamic> json) {
    var id = json['_id'];
    if (id is String) {
      try {
        id = mongo.ObjectId.fromHexString(id);
      } catch (e) {
        id = mongo.ObjectId();
      }
    } else if (id is! mongo.ObjectId) {
      id = mongo.ObjectId();
    }
    return CarModel(
      id: id as mongo.ObjectId,
      marca: json['marca'] as String,
      modelo: json['modelo'] as String,
      anyo: json['anyo'] as int,
      numero_serie: json['numero_serie'] as int,
      estado: json['estado'] as String,
      precio: json['precio'] as double,
    );
  }


}