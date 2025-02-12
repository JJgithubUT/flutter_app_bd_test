import 'package:flutter/material.dart';
import 'package:flutter_app_bd_1/models/phone_model.dart';
import 'package:flutter_app_bd_1/services/mongo_service.dart';

class PhonesScreen extends StatefulWidget {
  const PhonesScreen({super.key});

  @override
  State<PhonesScreen> createState() => _PhonesScreenState();
}

class _PhonesScreenState extends State<PhonesScreen> {
  List<PhoneModel> phones = [];

  @override
  void initState() {
    super.initState();
    _fetchPhones();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inventario de Telefonos'),
      ),
      // body: ListView.builder(itemBuilder: itemBuilder),
    );
  }

  void _fetchPhones() async {
    phones = await MongoService().getCelulares();
  }
}